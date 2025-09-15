import 'package:bitkub/view/bottom_view.dart';
import 'package:bitkub/view/menu_icons_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  static String svgAsset = "assets/images/bitkub.svg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            SvgPicture.asset(
              svgAsset,
              height: 40,
              width: 40,
              color: Colors.orange,
            ),
            const SizedBox(width: 10),
            Column(
              children: [
                const Text("Bitkub", style: TextStyle(color: Colors.white)),
                // Text("Exchange", style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(child: MenuIconsView()),
      bottomNavigationBar: BottomView(),
    );
  }
}
