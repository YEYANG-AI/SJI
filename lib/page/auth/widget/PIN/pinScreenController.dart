import 'package:bitkub/page/auth/widget/PIN/BiometricService.dart';
import 'package:bitkub/page/auth/widget/PIN/pinService.dart';
import 'package:flutter/material.dart';

class PinScreenController extends ChangeNotifier {
  String _pin = '';
  String _confirmPin = '';
  bool _isConfirming = false;
  bool _isLoading = false;
  bool _isAuthenticating = false;
  bool _hasNavigated = false;
  bool _isLogin = false;
  
  final PinService _pinService = PinService();
  final BiometricService _biometricService = BiometricService();

  // Getters
  String get pin => _pin;
  String get confirmPin => _confirmPin;
  bool get isConfirming => _isConfirming;
  bool get isLoading => _isLoading;
  bool get isAuthenticating => _isAuthenticating;
  bool get hasNavigated => _hasNavigated;
  bool get isLogin => _isLogin;
  String get currentPin => _isConfirming ? _confirmPin : _pin;

  void initialize(bool isLogin) {
    _isLogin = isLogin;
    notifyListeners();
  }

  void updateLoginStatus(bool isLogin) {
    _isLogin = isLogin;
    notifyListeners();
  }

  Future<void> attemptBiometricAuth({
    required BuildContext context,
    required VoidCallback onAuthSuccess,
  }) async {
    if (_isAuthenticating || _hasNavigated) return;

    _isAuthenticating = true;
    notifyListeners();

    try {
      final isAuthenticated = await _biometricService.authenticate(
        context: context,
        onAuthSuccess: onAuthSuccess,
      );

      if (!isAuthenticated && !_hasNavigated) {
        _isAuthenticating = false;
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Biometric auth error: $e');
      if (!_hasNavigated) {
        _isAuthenticating = false;
        notifyListeners();
      }
    }
  }

  void onAuthSuccess() {
    _hasNavigated = true;
    _isAuthenticating = false;
    notifyListeners();
  }

  void onNumberPressed(String number) {
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
      _pin += number;
      notifyListeners();
    }
  }

  void _handleConfirmInput(String number) {
    if (_confirmPin.length < 6) {
      _confirmPin += number;
      notifyListeners();
    }
  }

  void _handleSetupInput(String number) {
    if (_pin.length < 6) {
      _pin += number;
      notifyListeners();
      if (_pin.length == 6) {
        moveToConfirmation();
      }
    }
  }

  void onDeletePressed() {
    if (_isAuthenticating || _hasNavigated) return;

    if (_isConfirming) {
      if (_confirmPin.isNotEmpty) {
        _confirmPin = _confirmPin.substring(0, _confirmPin.length - 1);
        notifyListeners();
      }
    } else {
      if (_pin.isNotEmpty) {
        _pin = _pin.substring(0, _pin.length - 1);
        notifyListeners();
      }
    }
  }

  void moveToConfirmation() {
    _isConfirming = true;
    _confirmPin = '';
    notifyListeners();
  }

  Future<bool> validateLoginPin() async {
    if (_hasNavigated) return false;
    
    _isLoading = true;
    notifyListeners();

    try {
      final isValid = await _pinService.validatePin(_pin);
      
      if (isValid) {
        _hasNavigated = true;
        notifyListeners();
        return true;
      } else {
        _pin = '';
        notifyListeners();
        return false;
      }
    } catch (e) {
      debugPrint('Validate pin error: $e');
      return false;
    } finally {
      if (!_hasNavigated) {
        _isLoading = false;
        notifyListeners();
      }
    }
  }

  Future<bool> validateAndSavePin() async {
    if (_hasNavigated) return false;

    if (_pin == _confirmPin) {
      _isLoading = true;
      notifyListeners();

      try {
        await _pinService.savePin(_pin);
        _hasNavigated = true;
        notifyListeners();
        return true;
      } catch (e) {
        debugPrint('Save pin error: $e');
        return false;
      } finally {
        if (!_hasNavigated) {
          _isLoading = false;
          notifyListeners();
        }
      }
    } else {
      resetPinSetup();
      return false;
    }
  }

  void resetPinSetup() {
    _isConfirming = false;
    _pin = '';
    _confirmPin = '';
    notifyListeners();
  }

  @override
  void dispose() {
    _isAuthenticating = false;
    _hasNavigated = true;
    super.dispose();
  }
}