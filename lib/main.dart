import 'package:bitkub/router/router_path.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/core.dart';

void main() {
  SyncfusionLicense.registerLicense('YOUR_SYNC_FUSION_LICENSE_KEY');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouterPath.subHome,
      //home: WatchList(),
      onGenerateRoute: RouterPath.generateRoute,
    );
  }
}
