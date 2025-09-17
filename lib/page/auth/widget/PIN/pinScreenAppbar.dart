import 'package:flutter/material.dart';

class PinScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PinScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.keyboard_arrow_left, 
          size: 30, 
          color: Colors.white
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.more_vert, 
            color: Colors.white, 
            size: 30
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}