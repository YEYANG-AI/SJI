import 'package:bitkub/page/auth/widget/Register/RegisterComponents.dart';
import 'package:bitkub/page/auth/widget/Register/RegisterController.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final RegisterController _controller = RegisterController();
  final RegisterComponents _components = RegisterComponents();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Create Account',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.centerRight,
            colors: [Colors.black, Colors.orange.shade800],
            stops: const [0.8, 1],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
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
                _components.buildNameField(_controller.nameController),
                const SizedBox(height: 20),
                _components.buildEmailField(_controller.emailController),
                const SizedBox(height: 20),
                _components.buildPasswordField(
                  _controller.passwordController,
                  _controller.obscurePassword,
                  () => setState(() {
                    _controller.obscurePassword = !_controller.obscurePassword;
                  }),
                ),
                const SizedBox(height: 20),
                _components.buildConfirmPasswordField(
                  _controller.confirmPasswordController,
                  _controller.obscureConfirmPassword,
                  () => setState(() {
                    _controller.obscureConfirmPassword =
                        !_controller.obscureConfirmPassword;
                  }),
                  _controller.passwordController,
                ),
                const SizedBox(height: 30),
                _components.buildRegisterButton(
                  _controller.isLoading,
                  () => _controller.handleRegister(context),
                ),
                const SizedBox(height: 20),
                _components.buildLoginPrompt(() {
                  _controller.checkRegistrationAndNavigate(context);
                }),
                const SizedBox(height: 30),
                const Divider(color: Colors.white54),
                const SizedBox(height: 20),
                _components.buildSocialText(),
                const SizedBox(height: 20),
                _components.buildSocialButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
