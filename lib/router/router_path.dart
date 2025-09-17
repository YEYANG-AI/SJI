import 'package:bitkub/page/auth/login_page.dart';
import 'package:bitkub/page/auth/pinSet.dart';
import 'package:bitkub/page/auth/Register.dart';
import 'package:bitkub/page/auth/widget/home_widget.dart';
import 'package:bitkub/page/home_page.dart';
import 'package:bitkub/page/widget/analysis_widget.dart';
import 'package:bitkub/view/bottom_view.dart';
import 'package:flutter/material.dart';

class RouterPath {
  static const String login = '/login';
  static const String register = '/register';
  static const String bottomBar = '/bottomBar';
  static const String home = '/home';
  static const String subHome = '/subHome';
  static const String analysis = '/analysis';
  static const String setupPin = '/setupPin';

  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case bottomBar:
        return MaterialPageRoute(builder: (_) => BottomView());
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case subHome:
        return MaterialPageRoute(builder: (_) => HomeWidget());
      case analysis:
        return MaterialPageRoute(builder: (_) => AnalysisWidget());
      case register:
        return MaterialPageRoute(builder: (_) => Register());
      case setupPin:
        return MaterialPageRoute(builder: (_) => PinScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
