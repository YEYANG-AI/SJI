import 'package:bitkub/widget/AppColors.dart';
import 'package:flutter/material.dart';

class PinInputDisplay extends StatelessWidget {
  final bool isLogin;
  final bool isConfirming;
  final String currentPin;

  const PinInputDisplay({
    super.key,
    required this.isLogin,
    required this.isConfirming,
    required this.currentPin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40),
        Text(
          _getTitle(),
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          _getSubtitle(),
          style: TextStyle(color: AppColors.secTextColor, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 40),
        _buildLockIcon(),
        SizedBox(height: 30),
        _buildPinDots(),
        SizedBox(height: 30),
      ],
    );
  }

  String _getTitle() {
    if (isLogin) {
      return isConfirming ? 'Confirm PIN' : 'Login with PIN';
    } else {
      return isConfirming ? 'confirm PIN' : 'Setup PIN';
    }
  }

  String _getSubtitle() {
    if (isLogin) {
      return isConfirming
          ? 'Confirm PIN 4 Digits'
          : 'Fill PIN 4 Digits for Login';
    } else {
      return isConfirming
          ? 'Confirm PIN 4 Digits'
          : 'Setup PIN 4 Digits for Security';
    }
  }

  Widget _buildLockIcon() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.textColor, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(Icons.lock_outline, size: 40, color: AppColors.textColor),
    );
  }

  Widget _buildPinDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: index < currentPin.length
                  ? AppColors.textColor
                  : AppColors.secTextColor,
              width: 2,
            ),
            color: index < currentPin.length
                ? AppColors.textColor
                : Colors.transparent,
          ),
        );
      }),
    );
  }
}
