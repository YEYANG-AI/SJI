import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final VoidCallback? onRegisterPressed;

  const LoginButton({
    super.key,
    required this.onPressed,
    this.onRegisterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ปุ่ม Sign In
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: GestureDetector(
            onTap: onPressed,
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.black, Colors.orange.shade800],
                  stops: const [0.15, 1],
                ),
              ),
              child: const Center(
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),

        // ปุ่ม Don't have account yet (ถ้ามี callback)
        if (onRegisterPressed != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: TextButton(
              onPressed: onRegisterPressed,
              child: RichText(
                text: TextSpan(
                  text: "Don't have account yet? ",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14,
                  ),
                  children: const [
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
