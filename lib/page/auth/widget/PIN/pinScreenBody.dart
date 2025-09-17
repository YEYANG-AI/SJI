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
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.centerRight,
          colors: [Colors.black, Colors.orange.shade800],
          stops: const [0.8, 1],
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                ),
                PinScreenLoadingIndicator(isLoading: isLoading),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PinScreenLoadingIndicator extends StatelessWidget {
  final bool isLoading;

  const PinScreenLoadingIndicator({
    super.key,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: isLoading
          ? CircularProgressIndicator(
              color: Colors.orange.shade300,
            )
          : const SizedBox(height: 10),
    );
  }
}