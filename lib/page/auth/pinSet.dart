import 'package:bitkub/page/auth/widget/PIN/BiometricService.dart';
import 'package:bitkub/page/auth/widget/PIN/pinScreenAppbar.dart';
import 'package:bitkub/page/auth/widget/PIN/pinScreenBody.dart';
import 'package:bitkub/page/auth/widget/PIN/pinService.dart';
import 'package:flutter/material.dart';

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

  late final PinService _pinService;
  late final BiometricService _biometricService;

  @override
  void initState() {
    super.initState();
    _isLogin = widget.isLogin;
    _pinService = PinService();
    _biometricService = BiometricService();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _handleRouteArguments();
    _handleBiometricAuthOnLogin();
  }

  @override
  void dispose() {
    _isAuthenticating = false;
    _hasNavigated = true;
    super.dispose();
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

  void _handleBiometricAuthOnLogin() {
    if (_isLogin && !_hasNavigated && !_isAuthenticating) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && !_hasNavigated) {
          _attemptBiometricAuth();
        }
      });
    }
  }

  Future<void> _attemptBiometricAuth() async {
    if (_isAuthenticating || _hasNavigated || !mounted) {
      return;
    }

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

    Navigator.pushReplacementNamed(context, '/bottomBar');
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
    if (_pin.length < 6) {
      setState(() {
        _pin += number;
      });
      if (_pin.length == 6) {
        _validateLoginPin();
      }
    }
  }

  void _handleConfirmInput(String number) {
    if (_confirmPin.length < 6) {
      setState(() {
        _confirmPin += number;
      });
      if (_confirmPin.length == 6) {
        _validateAndSavePin();
      }
    }
  }

  void _handleSetupInput(String number) {
    if (_pin.length < 6) {
      setState(() {
        _pin += number;
      });
      if (_pin.length == 6) {
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
            _hasNavigated = true;
          });
          Navigator.pushReplacementNamed(context, '/bottomBar');
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
          Navigator.pushReplacementNamed(context, '/bottomBar');
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
      ),
    );
  }
}
