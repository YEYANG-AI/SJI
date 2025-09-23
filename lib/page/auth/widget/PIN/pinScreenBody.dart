import 'package:bitkub/page/auth/widget/PIN/NumberKeyPad.dart';
import 'package:bitkub/page/auth/widget/PIN/pinInoutDisplay.dart';
import 'package:flutter/material.dart';

class PinScreenBody extends StatelessWidget {
  final bool isLogin;
  final bool isConfirming;
  final bool isAuthenticating;
  final bool hasNavigated;
  final bool isLoading;
  final String currentPin;
  final Function(String) onNumberPressed;
  final VoidCallback onDeletePressed;
  final VoidCallback onBiometricPressed;
  final bool showBiometricButton; // เพิ่ม parameter นี้

  const PinScreenBody({
    super.key,
    required this.isLogin,
    required this.isConfirming,
    required this.isAuthenticating,
    required this.hasNavigated,
    required this.isLoading,
    required this.currentPin,
    required this.onNumberPressed,
    required this.onDeletePressed,
    required this.onBiometricPressed,
    this.showBiometricButton = false, // เพิ่ม default value
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.transparent,
      child: SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight:
                MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top -
                MediaQuery.of(context).padding.bottom,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PinInputDisplay(
                isLogin: isLogin,
                isConfirming: isConfirming,
                currentPin: currentPin,
              ),
              NumberKeypad(
                isLogin: isLogin,
                isAuthenticating: isAuthenticating,
                hasNavigated: hasNavigated,
                onNumberPressed: onNumberPressed,
                onDeletePressed: onDeletePressed,
                onBiometricPressed: onBiometricPressed,
                showBiometricButton: showBiometricButton, // ส่ง parameter ต่อไปยัง NumberKeypad
              ),
            ],
          ),
        ),
      ),
    );
  }
}