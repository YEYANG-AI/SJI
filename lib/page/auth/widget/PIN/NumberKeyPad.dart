import 'package:bitkub/widget/AppColors.dart';
import 'package:flutter/material.dart';

class NumberKeypad extends StatelessWidget {
  final bool isLogin;
  final bool isAuthenticating;
  final bool hasNavigated;
  final Function(String) onNumberPressed;
  final VoidCallback onDeletePressed;
  final VoidCallback onBiometricPressed;
  final bool showBiometricButton; // เพิ่ม parameter นี้

  const NumberKeypad({
    super.key,
    required this.isLogin,
    required this.isAuthenticating,
    required this.hasNavigated,
    required this.onNumberPressed,
    required this.onDeletePressed,
    required this.onBiometricPressed,
    this.showBiometricButton = false, // เพิ่ม default value
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        children: [
          _buildNumberRow(['1', '2', '3']),
          SizedBox(height: 20),
          _buildNumberRow(['4', '5', '6']),
          SizedBox(height: 20),
          _buildNumberRow(['7', '8', '9']),
          SizedBox(height: 20),
          _buildBottomRow(),
        ],
      ),
    );
  }

  Widget _buildNumberRow(List<String> numbers) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: numbers.map((number) => _buildNumberButton(number)).toList(),
    );
  }

  Widget _buildBottomRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // เปลี่ยนจาก isLogin เป็น showBiometricButton
        showBiometricButton ? _buildBiometricButton() : SizedBox(width: 80),
        _buildNumberButton('0'),
        _buildDeleteButton(),
      ],
    );
  }

  Widget _buildNumberButton(String number) {
    return GestureDetector(
      onTap: () => onNumberPressed(number),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.buttonTextColor.withOpacity(0.7),
            width: 2,
          ),
          // color: Colors.white.withOpacity(0.1),
        ),
        child: Center(
          child: Text(
            number,
            style: TextStyle(
              color: AppColors.buttonTextColor,
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteButton() {
    return GestureDetector(
      onTap: onDeletePressed,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.buttonTextColor.withOpacity(0.7),
            width: 2,
          ),
          // color: Colors.white.withOpacity(0.1),
        ),
        child: Center(
          child: Icon(
            Icons.backspace_outlined,
            color: AppColors.buttonTextColor,
            size: 35,
          ),
        ),
      ),
    );
  }

  Widget _buildBiometricButton() {
    return GestureDetector(
      onTap: () {
        if (!isAuthenticating && !hasNavigated) {
          onBiometricPressed();
        }
      },
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.buttonTextColor.withOpacity(0.7),
            width: 2,
          ),
          // color: Colors.white.withOpacity(0.1),
        ),
        child: Center(
          child: Icon(
            Icons.fingerprint,
            color: AppColors.buttonTextColor,
            size: 50,
          ),
        ),
      ),
    );
  }
}
