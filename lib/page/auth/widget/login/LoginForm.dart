import 'package:bitkub/widget/AppColors.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final FocusNode usernameFocusNode;
  final FocusNode passwordFocusNode;

  const LoginForm({
    super.key,
    required this.formKey,
    required this.usernameController,
    required this.passwordController,
    required this.usernameFocusNode,
    required this.passwordFocusNode,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Column(
        children: [
          // Username Field
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: AppColors.textColor.withOpacity(0.3),
                width: 1.5,
              ),
            ),
            child: TextFormField(
              focusNode: widget.usernameFocusNode,
              controller: widget.usernameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Username';
                }
                return null;
              },
              style: TextStyle(color: AppColors.textColor, fontSize: 16),
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(
                  color: AppColors.textColor.withOpacity(0.8),
                ),
                prefixIcon: Icon(
                  Icons.person,
                  color: AppColors.textColor.withOpacity(0.8),
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 18,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),

          // Password Field
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: AppColors.textColor.withOpacity(0.3),
                width: 1.5,
              ),
            ),
            child: TextFormField(
              focusNode: widget.passwordFocusNode,
              controller: widget.passwordController,
              obscureText: _obscureText,
              style: TextStyle(color: AppColors.textColor, fontSize: 16),
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: AppColors.textColor.withOpacity(0.8),
                ),
                prefixIcon: Icon(
                  Icons.lock,
                  color: AppColors.textColor.withOpacity(0.8),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.textColor.withOpacity(0.8),
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 18,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
