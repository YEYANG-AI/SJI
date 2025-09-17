import 'package:flutter/material.dart';

class NumberKeypad extends StatelessWidget {
  final bool isLogin;
  final bool isAuthenticating;
  final bool hasNavigated;
  final Function(String) onNumberPressed;
  final VoidCallback onDeletePressed;
  final VoidCallback onBiometricPressed;

  const NumberKeypad({
    super.key,
    required this.isLogin,
    required this.isAuthenticating,
    required this.hasNavigated,
    required this.onNumberPressed,
    required this.onDeletePressed,
    required this.onBiometricPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Column(
        children: [
          _buildNumberRow(['1', '2', '3']),
          SizedBox(height: 15),
          _buildNumberRow(['4', '5', '6']),
          SizedBox(height: 15),
          _buildNumberRow(['7', '8', '9']),
          SizedBox(height: 15),
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
        isLogin ? _buildBiometricButton() : SizedBox(width: 70),
        _buildNumberButton('0'),
        _buildDeleteButton(),
      ],
    );
  }

  Widget _buildNumberButton(String number) {
    return GestureDetector(
      onTap: () => onNumberPressed(number),
      child: Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white54, width: 1.5),
          color: Colors.transparent,
        ),
        child: Center(
          child: Text(
            number,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w500,
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
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white54, width: 1.5),
          color: Colors.transparent,
        ),
        child: Center(
          child: Icon(Icons.backspace_outlined, color: Colors.white, size: 22),
        ),
      ),
    );
  }

  Widget _buildBiometricButton() {
    return GestureDetector(
      onTap: () {
        // ตรวจสอบสถานะก่อนเรียก
        if (!isAuthenticating && !hasNavigated) {
          onBiometricPressed();
        }
      },
      child: Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white54, width: 1.5),
          color: Colors.transparent,
        ),
        child: Center(
          child: Icon(Icons.fingerprint, color: Colors.white, size: 28),
        ),
      ),
    );
  }
}