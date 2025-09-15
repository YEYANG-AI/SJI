import 'package:bitkub/page/home_page.dart';
import 'package:bitkub/page/trade_page.dart';
import 'package:bitkub/page/portfolio_page.dart';
import 'package:bitkub/page/market_page.dart';
import 'package:bitkub/page/watch_list.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class BottomView extends StatefulWidget {
  const BottomView({super.key});

  @override
  State<BottomView> createState() => _BottomViewState();
}

class _BottomViewState extends State<BottomView> {
  final List<Map<String, dynamic>> data = [
    {"name": "Home", "icon": LucideIcons.home, "page": const HomePage()},
    {
      "name": "Portfolio",
      "icon": LucideIcons.circleDot,
      "page": const PortfolioPage(),
    },
    {"name": "Trade", "icon": LucideIcons.coins, "page": const TradePage()},
    {"name": "Watchlist", "icon": LucideIcons.star, "page": const WatchList()},
    {"name": "Market", "icon": Icons.bar_chart, "page": const MarketPage()},
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: data.map((item) => item['page'] as Widget).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: data.map((item) {
          return BottomNavigationBarItem(
            icon: Icon(item['icon'], size: 20),
            activeIcon: Icon(item['icon'], size: 25),
            label: item['name'],
          );
        }).toList(),
      ),
    );
  }
}
