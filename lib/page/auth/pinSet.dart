import 'package:bitkub/page/auth/widget/PIN/BiometricService.dart';
import 'package:bitkub/page/auth/widget/PIN/pinScreenAppbar.dart';
import 'package:bitkub/page/auth/widget/PIN/pinScreenBody.dart';
import 'package:bitkub/page/auth/widget/PIN/pinService.dart';
import 'package:bitkub/view/bottom_view.dart';
import 'package:bitkub/widget/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PinScreen extends StatefulWidget {
  final bool isLogin;

  const PinScreen({super.key, this.isLogin = false});

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  String _pin = '';
  String _confirmPin = '';
  bool _isConfirming = false;
  bool _isLoading = false;
  bool _isAuthenticating = false;
  bool _hasNavigated = false;
  bool _isLogin = false;
  bool _isPinVerified = false;
  bool _biometricEnabledInSettings = false;

  late final PinService _pinService;
  late final BiometricService _biometricService;
  final String _biometricKey = 'biometric_enabled';

  @override
  void initState() {
    super.initState();
    _isLogin = widget.isLogin;
    _pinService = PinService();
    _biometricService = BiometricService();
    _loadBiometricSetting();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _handleRouteArguments();
  }

  @override
  void dispose() {
    _isAuthenticating = false;
    _hasNavigated = true;
    super.dispose();
  }

  // โหลดการตั้งค่า Biometric จาก SharedPreferences
  Future<void> _loadBiometricSetting() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        _biometricEnabledInSettings = prefs.getBool(_biometricKey) ?? false;
      });
      debugPrint('Biometric enabled in settings: $_biometricEnabledInSettings');
    } catch (e) {
      debugPrint('Error loading biometric setting: $e');
    }
  }

  void _handleRouteArguments() {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (args != null && args.containsKey('isLogin')) {
      setState(() {
        _isLogin = args['isLogin'] ?? false;
      });
    }

    debugPrint('PinScreen - Final isLogin: $_isLogin');
  }

  Future<void> _attemptBiometricAuth() async {
    if (!_isPinVerified) {
      // ถ้า PIN ยังไม่ผ่าน → แจ้งเตือน
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please verify your PIN first'),
            backgroundColor: Colors.red,
          ),
        );
      }
      return;
    }

    if (_isAuthenticating || _hasNavigated || !mounted) return;

    setState(() {
      _isAuthenticating = true;
    });

    try {
      final isAuthenticated = await _biometricService.authenticate(
        context: context,
        onAuthSuccess: _onAuthSuccess,
      );

      if (!isAuthenticated && mounted && !_hasNavigated) {
        setState(() {
          _isAuthenticating = false;
        });
        _showErrorMessage('Biometric Authentication Failed');
      }
    } catch (e) {
      debugPrint('Biometric auth error: $e');
      if (mounted && !_hasNavigated) {
        setState(() {
          _isAuthenticating = false;
        });
      }
    }
  }

  void _onAuthSuccess() {
    if (!mounted || _hasNavigated) return;

    setState(() {
      _hasNavigated = true;
      _isAuthenticating = false;
    });

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => BottomView()),
      (Route<dynamic> route) => false,
    );
  }

  void _onNumberPressed(String number) {
    if (_isAuthenticating || _hasNavigated) return;

    if (_isLogin && !_isConfirming) {
      _handleLoginInput(number);
    } else if (_isConfirming) {
      _handleConfirmInput(number);
    } else {
      _handleSetupInput(number);
    }
  }

  void _handleLoginInput(String number) {
    if (_pin.length < 4) {
      setState(() {
        _pin += number;
      });
      if (_pin.length == 4) {
        _validateLoginPin();
      }
    }
  }

  void _handleConfirmInput(String number) {
    if (_confirmPin.length < 4) {
      setState(() {
        _confirmPin += number;
      });
      if (_confirmPin.length == 4) {
        _validateAndSavePin();
      }
    }
  }

  void _handleSetupInput(String number) {
    if (_pin.length < 4) {
      setState(() {
        _pin += number;
      });
      if (_pin.length == 4) {
        _moveToConfirmation();
      }
    }
  }

  void _onDeletePressed() {
    if (_isAuthenticating || _hasNavigated) return;

    if (_isConfirming) {
      if (_confirmPin.isNotEmpty) {
        setState(() {
          _confirmPin = _confirmPin.substring(0, _confirmPin.length - 1);
        });
      }
    } else {
      if (_pin.isNotEmpty) {
        setState(() {
          _pin = _pin.substring(0, _pin.length - 1);
        });
      }
    }
  }

  void _moveToConfirmation() {
    setState(() {
      _isConfirming = true;
      _confirmPin = '';
    });
  }

  Future<void> _validateLoginPin() async {
    if (_hasNavigated) return;
    setState(() {
      _isLoading = true;
    });

    try {
      final isValid = await _pinService.validatePin(_pin);

      if (mounted && !_hasNavigated) {
        if (isValid) {
          setState(() {
            _isPinVerified = true;
          });

          // ตรวจสอบว่า Biometric เปิดในการตั้งค่าหรือไม่
          if (_biometricEnabledInSettings) {
            // ถ้าเปิดใน Settings ให้ตรวจสอบว่าอุปกรณ์รองรับหรือไม่
            final deviceSupported = await _biometricService.isDeviceSupported();
            final canCheck = await _biometricService.canCheckBiometrics();
            final hasBiometrics = await _biometricService.hasBiometrics();

            if (deviceSupported && canCheck && hasBiometrics) {
              // เริ่มใช้ Biometric Authentication
              setState(() {
                _isAuthenticating = true;
              });
              
              final biometricSuccess = await _biometricService.authenticate(
                context: context,
                onAuthSuccess: _onAuthSuccess,
              );

              if (!biometricSuccess && mounted && !_hasNavigated) {
                _showErrorMessage('Biometric Authentication Failed');
                setState(() {
                  _isAuthenticating = false;
                  _pin = '';
                });
              }
            } else {
              // อุปกรณ์ไม่รองรับ Biometric แต่เปิดใน Settings
              debugPrint('Biometric not supported on device, proceeding without biometric');
              _onAuthSuccess(); // เข้าแอพเลย
            }
          } else {
            // Biometric ไม่ได้เปิดใน Settings → เข้าแอพเลย
            debugPrint('Biometric disabled in settings, proceeding without biometric');
            _onAuthSuccess();
          }
        } else {
          _showErrorMessage('PIN is Incorrect');
          setState(() {
            _pin = '';
          });
        }
      }
    } catch (e) {
      if (mounted && !_hasNavigated) {
        _showErrorMessage('Something Wrong: $e');
      }
    } finally {
      if (mounted && !_hasNavigated) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _validateAndSavePin() async {
    if (_hasNavigated) return;

    if (_pin == _confirmPin) {
      setState(() {
        _isLoading = true;
      });

      try {
        await _pinService.savePin(_pin);

        if (mounted && !_hasNavigated) {
          setState(() {
            _hasNavigated = true;
          });
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => BottomView()),
            (Route<dynamic> route) => false,
          );
        }
      } catch (e) {
        if (mounted && !_hasNavigated) {
          _showErrorMessage('Something Wrong: $e');
        }
      } finally {
        if (mounted && !_hasNavigated) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    } else {
      if (mounted && !_hasNavigated) {
        _showErrorMessage('PIN Not Match');
        setState(() {
          _isConfirming = false;
          _pin = '';
          _confirmPin = '';
        });
      }
    }
  }

  void _showErrorMessage(String message) {
    if (mounted && !_hasNavigated) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // กำหนดพื้นหลัง gradient ที่นี่
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.primaryColor, AppColors.secondColor],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PinScreenAppBar(),
          body: PinScreenBody(
            isLogin: _isLogin,
            isConfirming: _isConfirming,
            isAuthenticating: _isAuthenticating,
            hasNavigated: _hasNavigated,
            isLoading: _isLoading,
            currentPin: _isConfirming ? _confirmPin : _pin,
            onNumberPressed: _onNumberPressed,
            onDeletePressed: _onDeletePressed,
            onBiometricPressed: _attemptBiometricAuth,
            showBiometricButton: _isLogin && _biometricEnabledInSettings && _isPinVerified,
          ),
        ),
      ),
    );
  }
}