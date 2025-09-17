import 'package:bitkub/page/auth/pinSet.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool isLoading = false;

  Future<void> checkRegistrationAndNavigate(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final isRegistered = prefs.getBool('isRegistered') ?? false;

    if (!context.mounted) return;

    if (isRegistered) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PinScreen(isLogin: true)),
      );
    } else {
      Navigator.pushNamed(context, '/login');
    }
  }

  Future<void> handleRegister(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      notifyStateChanged(context);

      try {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isRegistered', true);
        await prefs.setString('userName', nameController.text);
        await prefs.setString('userEmail', emailController.text);
        await prefs.setString('userPassword', passwordController.text);

        if (context.mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const PinScreen()),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Registration failed: $e'))
          );
        }
      } finally {
        isLoading = false;
        notifyStateChanged(context);
      }
    }
  }

  void notifyStateChanged(BuildContext context) {
    if (context.mounted) {
      // เรียก setState ของ parent widget
      (context as Element).markNeedsBuild();
    }
  }

  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}