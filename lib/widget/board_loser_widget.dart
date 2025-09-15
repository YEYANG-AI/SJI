import 'package:flutter/material.dart';

class BoardLoserWidget extends StatefulWidget {
  const BoardLoserWidget({super.key});

  @override
  State<BoardLoserWidget> createState() => _BoardLoserWidgetState();
}

class _BoardLoserWidgetState extends State<BoardLoserWidget> {
  final List<Map<String, dynamic>> data = [
    {
      "name": "USDT",
      "coin": "35.6M",
      "thb": "1148.2M",
      "price": 32.29,
      "isUp": false,
    },
    {
      "name": "ETH",
      "coin": "3.8K",
      "thb": "481.8M",
      "price": 126023.89,
      "isUp": true,
    },
    {
      "name": "BTC",
      "coin": "102.51",
      "thb": "386.3M",
      "price": 3768537.67,
      "isUp": true,
    },
    {
      "name": "XRP",
      "coin": "3.5M",
      "thb": "379.3M",
      "price": 108.8,
      "isUp": true,
    },
    {
      "name": "DOGE",
      "coin": "26.1M",
      "thb": "187.6M",
      "price": 7.1849,
      "isUp": true,
    },
    {"name": "XLM", "coin": "4.9M", "thb": "73M", "price": 14.91, "isUp": true},
    {
      "name": "ADA",
      "coin": "2.6M",
      "thb": "67.4M",
      "price": 25.65,
      "isUp": true,
    },
    {
      "name": "HBAR",
      "coin": "5.7M",
      "thb": "48.6M",
      "price": 8.56,
      "isUp": true,
    },
    {
      "name": "CRV",
      "coin": "1.3M",
      "thb": "40.7M",
      "price": 30.54,
      "isUp": true,
    },
    {
      "name": "SOL",
      "coin": "6.9K",
      "thb": "39M",
      "price": 5649.64,
      "isUp": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
        const Divider(color: Colors.grey, height: 20),
        ...data.asMap().entries.map(
          (entry) => _buildRow(entry.key, entry.value),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      children: const [
        Expanded(
          flex: 1,
          child: Text(
            "No.",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
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

  Widget _buildRow(int index, Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              "${index + 1})",
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              item["name"],
              style: TextStyle(
                color: item["isUp"] ? Colors.greenAccent : Colors.redAccent,
                fontSize: 12,
              ),
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
            child: Text(
              item["price"].toString(),
              style: TextStyle(
                color: item["isUp"] ? Colors.greenAccent : Colors.redAccent,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
