import 'package:flutter/material.dart';

class BalanceWidget extends StatefulWidget {
  const BalanceWidget({super.key});

  @override
  State<BalanceWidget> createState() => _BalanceWidgetState();
}

class _BalanceWidgetState extends State<BalanceWidget> {
  List<dynamic> balance = [
    {"name": "BTC/THB", "coin": "3,715,000", "percent": "0,74%"},
    {"name": "ETH/THB", "coin": "3,715,000", "percent": "0,74%"},
    {"name": "BCH/THB", "coin": "3,715,000", "percent": "0,74%"},
    {"name": "USDT/THB", "coin": "3,715,000", "percent": "0,74%"},
    {"name": "XLM/THB", "coin": "3,715,000", "percent": "0,74%"},
    {"name": "XRP/THB", "coin": "3,715,000", "percent": "0,74%"},
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        // Removed mainAxisAlignment
        children: balance
            .map(
              (item) => Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 20.0, // slightly more space between items
                ),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['name'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['coin'],
                      style: const TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['percent'],
                      style: const TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
