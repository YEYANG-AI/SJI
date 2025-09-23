import 'package:bitkub/widget/AppColors.dart';
import 'package:flutter/material.dart';

class RegisterComponents {
  Widget buildTitle() {
    return const Text(
      'Join SJI Investment',
      style: TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.w800,
        letterSpacing: 1.2,
      ),
    );
  }

  Widget buildSubtitle() {
    return Text(
      'Create your account to get started',
      style: TextStyle(
        color: Colors.white.withOpacity(0.9),
        fontSize: 16,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget buildNameField(TextEditingController controller, FocusNode focusNode) {
    return _buildTextField(
      controller: controller,
      focusNode: focusNode,
      label: 'Full Name',
      prefixIcon: Icons.person,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your name';
        }
        return null;
      },
    );
  }

  Widget buildEmailField(
    TextEditingController controller,
    FocusNode focusNode,
  ) {
    return _buildTextField(
      controller: controller,
      focusNode: focusNode,
      label: 'Email Address',
      prefixIcon: Icons.email,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }

  Widget buildPasswordField(
    TextEditingController controller,
    bool obscureText,
    VoidCallback onToggle,
    FocusNode focusNode,
  ) {
    return _buildPasswordField(
      controller: controller,
      focusNode: focusNode,
      label: 'Password',
      obscureText: obscureText,
      onToggle: onToggle,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a password';
        }
        if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
    );
  }

  Widget buildConfirmPasswordField(
    TextEditingController controller,
    bool obscureText,
    VoidCallback onToggle,
    TextEditingController passwordController,
    FocusNode focusNode,
  ) {
    return _buildPasswordField(
      controller: controller,
      focusNode: focusNode,
      label: 'Confirm Password',
      obscureText: obscureText,
      onToggle: onToggle,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please confirm your password';
        }
        if (value != passwordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
    );
  }

  Widget buildRegisterButton(bool isLoading, VoidCallback onPressed) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            offset: Offset(0, 6),
            spreadRadius: 1,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: isLoading ? null : onPressed,
          child: Center(
            child: isLoading
                ? CircularProgressIndicator(color: Colors.orange[800])
                : Text(
                    'CREATE ACCOUNT',
                    style: TextStyle(
                      color: AppColors.secondColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.5,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget buildLoginPrompt(VoidCallback onPressed) {
    return Center(
      child: TextButton(
        onPressed: onPressed,
        child: RichText(
          text: TextSpan(
            text: 'Already have an account? ',
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            children: [
              TextSpan(
                text: 'Sign In',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                  decorationThickness: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSocialText() {
    return Text(
      'Or sign up with',
      style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14),
    );
  }

  Widget buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.facebook, color: Colors.white, size: 60),
        ),
        const SizedBox(width: 20),
        IconButton(
          onPressed: () {},
          icon: Image.asset('assets/images/g.png', width: 60, height: 60),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String label,
    required IconData prefixIcon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 1.5),
      ),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: keyboardType,
        style: TextStyle(color: Colors.white, fontSize: 16),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
          prefixIcon: Icon(prefixIcon, color: Colors.white.withOpacity(0.8)),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        ),
        validator: validator,
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String label,
    required bool obscureText,
    required VoidCallback onToggle,
    required String? Function(String?)? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 1.5),
      ),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        obscureText: obscureText,
        style: TextStyle(color: Colors.white, fontSize: 16),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
          prefixIcon: Icon(Icons.lock, color: Colors.white.withOpacity(0.8)),
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off,
              color: Colors.white.withOpacity(0.8),
            ),
            onPressed: onToggle,
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        ),
        validator: validator,
      ),
    );
  }
}
