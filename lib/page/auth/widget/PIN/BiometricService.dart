import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class BiometricService {
  final LocalAuthentication _auth = LocalAuthentication();

  /// ตรวจสอบว่าอุปกรณ์รองรับ biometric หรือไม่
  Future<bool> isDeviceSupported() async {
    return await _auth.isDeviceSupported();
  }

  /// ตรวจสอบว่าสามารถใช้ biometric ได้หรือไม่
  Future<bool> canCheckBiometrics() async {
    return await _auth.canCheckBiometrics;
  }

  /// รับรายการ biometric ที่ใช้งานได้
  Future<List<BiometricType>> getAvailableBiometrics() async {
    return await _auth.getAvailableBiometrics();
  }

  /// ตรวจสอบสิทธิ์ด้วย biometric
  Future<bool> authenticate({
    required BuildContext context,
    VoidCallback? onAuthSuccess,
  }) async {
    try {
      final bool deviceSupported = await isDeviceSupported();
      final bool canCheck = await canCheckBiometrics();

      if (!deviceSupported && !canCheck) {
        return false;
      }

      await Future.delayed(const Duration(milliseconds: 500));

      final available = await getAvailableBiometrics();
      bool didAuth = false;

      // ลอง Face ID ก่อน
      if (available.contains(BiometricType.face)) {
        didAuth = await _authenticateWithBiometric(
          localizedReason: 'Unlock with Face ID',
        );

        if (didAuth) {
          onAuthSuccess?.call();
          return true;
        }
      }

      // หาก Face ID ไม่สำเร็จ ลอง Fingerprint
      if (!didAuth) {
        didAuth = await _authenticateWithBiometric(
          localizedReason: 'Unlock with fingerprint',
        );

        if (didAuth) {
          onAuthSuccess?.call();
          return true;
        }
      }

      return false;
    } catch (e) {
      debugPrint('Biometric authentication error: $e');
      return false;
    }
  }

  /// ตรวจสอบสิทธิ์ด้วย biometric แบบกำหนดเอง
  Future<bool> _authenticateWithBiometric({
    required String localizedReason,
  }) async {
    try {
      return await _auth.authenticate(
        localizedReason: localizedReason,
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: false,
          useErrorDialogs: false,
        ),
      );
    } catch (e) {
      debugPrint('Authentication error: $e');
      return false;
    }
  }

  /// ตรวจสอบว่ามี Face ID หรือไม่
  Future<bool> hasFaceID() async {
    final available = await getAvailableBiometrics();
    return available.contains(BiometricType.face);
  }

  /// ตรวจสอบว่ามี Fingerprint หรือไม่
  Future<bool> hasFingerprint() async {
    final available = await getAvailableBiometrics();
    return available.contains(BiometricType.fingerprint);
  }

  /// ตรวจสอบว่ามี biometric ใดๆ ใช้งานได้หรือไม่
  Future<bool> hasBiometrics() async {
    final available = await getAvailableBiometrics();
    return available.isNotEmpty;
  }
}
