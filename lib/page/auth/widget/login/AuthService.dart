// lib/shared/services/auth_service.dart
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static Future<void> saveUserCredentials(
    String username,
    String password,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isRegistered', true);
    await prefs.setString('username', username);
    await prefs.setString('password', password);
  }

  static Future<Map<String, String?>> getSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'username': prefs.getString('username'),
      'password': prefs.getString('password'),
    };
  }

  static Future<void> clearCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    await prefs.remove('password');
    await prefs.setBool('isRegistered', false);
  }
}
