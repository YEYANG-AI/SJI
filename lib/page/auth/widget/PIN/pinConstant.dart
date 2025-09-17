import 'package:flutter/material.dart';

class PinConstants {
  // ขนาดของ PIN
  static const int pinLength = 6;
  
  // ข้อความ
  static const String loginTitle = 'Login with PIN';
  static const String setupTitle = 'Setup PIN';
  static const String confirmTitle = 'Confirm PIN';
  
  static const String loginSubtitle = 'Fill PIN 6 Digits for Login';
  static const String setupSubtitle = 'Setup PIN 6 Digits for Security';
  static const String confirmSubtitle = 'Confirm PIN 6 Digits';
  
  // ข้อความ Error
  static const String pinIncorrect = 'PIN is Incorrect';
  static const String pinNotMatch = 'PIN Not Match';
  static const String somethingWrong = 'Something Wrong';
  
  // ข้อความ Biometric
  static const String unlockWithFaceId = 'Unlock with Face ID';
  static const String unlockWithFingerprint = 'Unlock with fingerprint';
  
  // สี
  static final Color primaryOrange = Colors.orange.shade300;
  static final Color darkOrange = Colors.orange.shade800;
  static const Color primaryWhite = Colors.white;
  static const Color whiteTransparent = Colors.white54;
  static const Color white70 = Colors.white70;
  static const Color primaryBlack = Colors.black;
  static const Color errorRed = Colors.red;
  static const Color transparent = Colors.transparent;
  
  // ขนาด
  static const double buttonSize = 65.0;
  static const double iconSize = 30.0;
  static const double lockIconSize = 80.0;
  static const double lockIconInnerSize = 40.0;
  static const double pinDotSize = 20.0;
  static const double borderWidth = 2.0;
  static const double borderRadiusButton = 12.0;
  
  // Routes
  static const String bottomBarRoute = '/bottomBar';
  
  // Animation Duration
  static const Duration biometricDelay = Duration(milliseconds: 500);
}

class PinStyles {
  // Text Styles
  static const TextStyle titleStyle = TextStyle(
    color: PinConstants.primaryWhite,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  
  static const TextStyle subtitleStyle = TextStyle(
    color: PinConstants.white70,
    fontSize: 16,
  );
  
  static const TextStyle buttonTextStyle = TextStyle(
    color: PinConstants.primaryWhite,
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );
  
  // Container Decorations
  static BoxDecoration get lockIconDecoration => BoxDecoration(
    border: Border.all(color: PinConstants.whiteTransparent, width: PinConstants.borderWidth),
    borderRadius: BorderRadius.circular(PinConstants.borderRadiusButton),
  );
  
  static BoxDecoration get buttonDecoration => BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(color: PinConstants.whiteTransparent, width: 1.5),
    color: PinConstants.transparent,
  );
  
  static BoxDecoration pinDotDecoration(bool isFilled) => BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(
      color: isFilled ? PinConstants.primaryOrange : PinConstants.whiteTransparent,
      width: PinConstants.borderWidth,
    ),
    color: isFilled ? PinConstants.primaryOrange : PinConstants.transparent,
  );
  
  // Gradient
  static LinearGradient get backgroundGradient => LinearGradient(
    begin: Alignment.center,
    end: Alignment.centerRight,
    colors: [PinConstants.primaryBlack, PinConstants.darkOrange],
    stops: [0.8, 1],
  );
}