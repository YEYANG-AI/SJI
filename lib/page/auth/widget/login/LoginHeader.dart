// lib/page/auth/login/login_header.dart
import 'package:bitkub/widget/AppColors.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Logo section
        Container(
          margin: const EdgeInsets.only(top: 0, bottom: 20),
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            color: AppColors.borderColor,
            borderRadius: BorderRadius.circular(75),
            boxShadow: [
              BoxShadow(
                color: AppColors.textColor.withOpacity(0.5),
                spreadRadius: 4,
                blurRadius: 16,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(75),
            child: Image.asset("assets/images/sji_logo.jpeg"),
          ),
        ),

        Container(
          margin: const EdgeInsets.only(bottom: 30),
          child: Text(
            "SJI Investment Cooperation",
            style: TextStyle(
              color: AppColors.textColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
