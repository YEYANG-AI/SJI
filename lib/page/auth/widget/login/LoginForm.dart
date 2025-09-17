// lib/page/auth/login/login_form.dart
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            focusNode: widget.usernameFocusNode,
            controller: widget.usernameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Username';
              }
              return null;
            },
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Username',
              labelStyle: const TextStyle(color: Colors.white70),
              prefixIcon: const Icon(Icons.person, color: Colors.white70),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.white54),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.white54),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.orange),
              ),
              filled: true,
              fillColor: Colors.black.withOpacity(0.3),
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            focusNode: widget.passwordFocusNode,
            controller: widget.passwordController,
            obscureText: _obscureText,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: const TextStyle(color: Colors.white70),
              prefixIcon: const Icon(Icons.lock, color: Colors.white70),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white70,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.white54),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.white54),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.orange),
              ),
              filled: true,
              fillColor: Colors.black.withOpacity(0.3),
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
        ],
      ),
    );
  }
}
