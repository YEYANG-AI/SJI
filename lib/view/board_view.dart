import 'package:bitkub/widget/board_gainer_widget.dart';
import 'package:bitkub/widget/board_loser_widget.dart';
import 'package:flutter/material.dart';

class BoardView extends StatefulWidget {
  const BoardView({super.key});

  @override
  State<BoardView> createState() => _BoardViewState();
}

class _BoardViewState extends State<BoardView> {
  final List<Map<String, dynamic>> cryptoData = [
    {
      "icon": Icons.monetization_on_outlined,
      "name": "USDT",
      "coin": "35.6M",
      "thb": "1148.2M",
      "price": 32.29,
      "isUp": false,
    },
    {
      "icon": Icons.monetization_on_outlined,
      "name": "ETH",
      "coin": "3.8K",
      "thb": "481.8M",
      "price": 126023.89,
      "isUp": true,
    },
    {
      "icon": Icons.monetization_on_outlined,
      "name": "BTC",
      "coin": "102.51",
      "thb": "386.3M",
      "price": 3768537.67,
      "isUp": true,
    },
    {
      "icon": Icons.monetization_on_outlined,
      "name": "XRP",
      "coin": "3.5M",
      "thb": "379.3M",
      "price": 108.8,
      "isUp": true,
    },
    {
      "icon": Icons.monetization_on_outlined,
      "name": "DOGE",
      "coin": "26.1M",
      "thb": "187.6M",
      "price": 7.1849,
      "isUp": true,
    },
    {
      "icon": Icons.monetization_on_outlined,
      "name": "XLM",
      "coin": "4.9M",
      "thb": "73M",
      "price": 14.91,
      "isUp": true,
    },
    {
      "icon": Icons.monetization_on_outlined,
      "name": "ADA",
      "coin": "2.6M",
      "thb": "67.4M",
      "price": 25.65,
      "isUp": true,
    },
    {
      "icon": Icons.monetization_on_outlined,
      "name": "HBAR",
      "coin": "5.7M",
      "thb": "48.6M",
      "price": 8.56,
      "isUp": true,
    },
    {
      "icon": Icons.monetization_on_outlined,
      "name": "CRV",
      "coin": "1.3M",
      "thb": "40.7M",
      "price": 30.54,
      "isUp": true,
    },
    {
      "icon": Icons.monetization_on_outlined,
      "name": "SOL",
      "coin": "6.9K",
      "thb": "39M",
      "price": 5649.64,
      "isUp": true,
    },
  ];

  int selectedTab = 0;
  final List<String> tabTitles = ["Popular quote", "Top Gainers", "Top Losers"];

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // ทางเลือกที่กะทัดรัดกว่า
          // แก้ไขส่วนของ Row ที่สร้าง Tab buttons
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(tabTitles.length, (index) {
                final isSelected = selectedTab == index;
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: isSelected
                          ? Colors.orange.shade800
                          : Colors.transparent,
                      foregroundColor: isSelected
                          ? Colors.white
                          : Colors.orange.shade800,
                      side: BorderSide(color: Colors.orange, width: 1.5),
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12, // ลด horizontal padding
                        vertical: 6, // ลด vertical padding
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedTab = index;
                      });
                    },
                    child: Text(
                      tabTitles[index],
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 12, // ลดขนาดฟอนต์
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 500,
            child: Builder(
              builder: (context) {
                if (selectedTab == 0) {
                  return _buildTable();
                } else if (selectedTab == 1) {
                  return BoardGainerWidget();
                } else {
                  return BoardLoserWidget();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTable() {
    return Column(
      children: [
        _buildHeader(),
        const Divider(color: Colors.grey, height: 20),
        ...cryptoData.map((item) => _buildRow(item)),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      children: const [
        Expanded(
          flex: 2,
          child: Text(
            "เหรียญ",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            "ปริมาณ(Coin)",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            "ปริมาณ(THB)",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            "ราคาล่าสุด(THB)",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildRow(Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  padding: const EdgeInsets.all(4),
                  child: Icon(item["icon"], color: Colors.orange, size: 20),
                ),
                SizedBox(width: 5),
                Text(
                  item["name"],
                  style: TextStyle(
                    color: item["isUp"] ? Colors.greenAccent : Colors.redAccent,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              item["coin"],
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              item["thb"],
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Text(
                  item["price"].toString(),
                  style: TextStyle(
                    color: item["isUp"] ? Colors.greenAccent : Colors.redAccent,
                    fontSize: 12,
                  ),
                ),
                Icon(
                  item["isUp"] ? Icons.arrow_upward : Icons.arrow_downward,
                  color: item["isUp"] ? Colors.greenAccent : Colors.redAccent,
                  size: 12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
