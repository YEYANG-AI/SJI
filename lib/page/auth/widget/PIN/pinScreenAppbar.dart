import 'package:bitkub/widget/AppColors.dart';
import 'package:flutter/material.dart';

class PinScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PinScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.transparent, // เปลี่ยนเป็นสีโปร่งใส
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.keyboard_arrow_left,
          size: 30,
          color: AppColors.textColor,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            'Forgot Password',
            style: TextStyle(
              color: AppColors.textColor,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(height: 20, width: 2, color: AppColors.textColor),
        TextButton(
          onPressed: () {},
          child: Text(
            'Log Out?',
            style: TextStyle(
              color: AppColors.textColor,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
