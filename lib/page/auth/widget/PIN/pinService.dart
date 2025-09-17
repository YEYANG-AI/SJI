import 'package:shared_preferences/shared_preferences.dart';

class PinService {
  static const String _pinKey = 'userPin';
  static const String _isPinSetupKey = 'isPinSetup';

  /// บันทึก PIN ของผู้ใช้
  Future<void> savePin(String pin) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_pinKey, pin);
    await prefs.setBool(_isPinSetupKey, true);
  }

  /// ตรวจสอบ PIN ที่ผู้ใช้ป้อน
  Future<bool> validatePin(String inputPin) async {
    final prefs = await SharedPreferences.getInstance();
    final savedPin = prefs.getString(_pinKey);
    return savedPin != null && savedPin == inputPin;
  }

  /// ตรวจสอบว่าได้ตั้งค่า PIN แล้วหรือไม่
  Future<bool> isPinSetup() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isPinSetupKey) ?? false;
  }

  /// รับ PIN ที่บันทึกไว้ (สำหรับการทดสอบหรือใช้งานพิเศษ)
  Future<String?> getSavedPin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_pinKey);
  }

  /// ลบ PIN ที่บันทึกไว้
  Future<void> clearPin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_pinKey);
    await prefs.setBool(_isPinSetupKey, false);
  }

  /// เปลี่ยน PIN
  Future<void> changePin(String oldPin, String newPin) async {
    final isValid = await validatePin(oldPin);
    if (!isValid) {
      throw Exception('Old PIN is incorrect');
    }
    await savePin(newPin);
  }
}