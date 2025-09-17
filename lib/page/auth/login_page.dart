// lib/page/auth/login/login_page.dart
import 'package:bitkub/page/auth/pinSet.dart';
import 'package:bitkub/page/auth/widget/login/AuthService.dart';
import 'package:bitkub/page/auth/widget/login/LoginButton.dart';
import 'package:bitkub/page/auth/widget/login/LoginForm.dart';
import 'package:bitkub/page/auth/widget/login/LoginHeader.dart';
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
    return GestureDetector(
      onTap: _dismissKeyboardAndFocus,
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.keyboard_arrow_left,
              size: 30,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.white, size: 30),
              onPressed: () {},
            ),
          ],
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom > 0 ? 16 : 0,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Form(
                    key: _formKey,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.centerRight,
                          colors: [Colors.black, Colors.orange.shade800],
                          stops: const [0.8, 1],
                        ),
                      ),
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

                          // Forgot Password Link
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: Colors.orange.shade300,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
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

                          const SizedBox(height: 60),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
