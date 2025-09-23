import 'package:bitkub/page/auth/widget/Register/RegisterComponents.dart';
import 'package:bitkub/page/auth/widget/Register/RegisterController.dart';
import 'package:bitkub/widget/AppColors.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final RegisterController _controller = RegisterController();
  final RegisterComponents _components = RegisterComponents();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  void _dismissKeyboard() {
    _nameFocusNode.unfocus();
    _emailFocusNode.unfocus();
    _passwordFocusNode.unfocus();
    _confirmPasswordFocusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _dismissKeyboard,
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        extendBodyBehindAppBar: true, // ✅ Gradient ครอบ AppBar
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              _dismissKeyboard();
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Create Account',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
        ),
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
          child: SafeArea(
            child: Stack(
              children: [
                // Main content
                SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Form(
                    key: _controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        _components.buildTitle(),
                        const SizedBox(height: 10),
                        _components.buildSubtitle(),
                        const SizedBox(height: 30),

                        // Name
                        _components.buildNameField(
                          _controller.nameController,
                          _nameFocusNode,
                        ),
                        const SizedBox(height: 20),

                        // Email
                        _components.buildEmailField(
                          _controller.emailController,
                          _emailFocusNode,
                        ),
                        const SizedBox(height: 20),

                        // Password
                        _components.buildPasswordField(
                          _controller.passwordController,
                          _controller.obscurePassword,
                          () => setState(() {
                            _controller.obscurePassword =
                                !_controller.obscurePassword;
                          }),
                          _passwordFocusNode,
                        ),
                        const SizedBox(height: 20),

                        // Confirm Password
                        _components.buildConfirmPasswordField(
                          _controller.confirmPasswordController,
                          _controller.obscureConfirmPassword,
                          () => setState(() {
                            _controller.obscureConfirmPassword =
                                !_controller.obscureConfirmPassword;
                          }),
                          _controller.passwordController,
                          _confirmPasswordFocusNode,
                        ),
                        const SizedBox(height: 30),

                        // Register button
                        _components.buildRegisterButton(
                          _controller.isLoading,
                          () {
                            _dismissKeyboard();
                            _controller.handleRegister(context);
                          },
                        ),
                        const SizedBox(height: 20),

                        // Already have account? Login
                        _components.buildLoginPrompt(() {
                          _dismissKeyboard();
                          _controller.checkRegistrationAndNavigate(context);
                        }),
                        const SizedBox(height: 30),

                        const Divider(color: Colors.white54),
                        const SizedBox(height: 20),
                        _components.buildSocialText(),
                        const SizedBox(height: 20),
                        _components.buildSocialButtons(),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _controller.dispose();
    super.dispose();
  }
}
