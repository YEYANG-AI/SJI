import 'package:bitkub/page/auth/pinSet.dart';
import 'package:bitkub/page/auth/widget/login/AuthService.dart';
import 'package:bitkub/page/auth/widget/login/LoginButton.dart';
import 'package:bitkub/page/auth/widget/login/LoginForm.dart';
import 'package:bitkub/page/auth/widget/login/LoginHeader.dart';
import 'package:bitkub/widget/AppColors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _onLoginSuccess() async {
    await AuthService.saveUserCredentials(
      _usernameController.text,
      _passwordController.text,
    );

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PinScreen(isLogin: true)),
      );
    }
  }

  void _dismissKeyboardAndFocus() {
    FocusScope.of(context).unfocus();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      _onLoginSuccess();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.primaryColor, AppColors.secondColor],
          ),
        ),
        child: Column(
          children: [
            // AppBar
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.keyboard_arrow_left,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),

            SizedBox(height: 20),

            Expanded(
              child: GestureDetector(
                onTap: _dismissKeyboardAndFocus,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const LoginHeader(),
                      LoginForm(
                        formKey: _formKey,
                        usernameController: _usernameController,
                        passwordController: _passwordController,
                        usernameFocusNode: _usernameFocusNode,
                        passwordFocusNode: _passwordFocusNode,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      LoginButton(
                        onPressed: _handleLogin,
                        onRegisterPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
