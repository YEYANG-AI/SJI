import 'package:bitkub/page/menu_appbar.dart';
import 'package:bitkub/widget/table_widget.dart';
import 'package:flutter/material.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: MenuAppbar(),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          // เพิ่ม SingleChildScrollView
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "5.09K",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        "0",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Unrealized P&L",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "Realized P&L",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 100),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("0", style: TextStyle(color: Colors.green)),
                              Text("0", style: TextStyle(color: Colors.green)),
                            ],
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.arrow_drop_down, color: Colors.white),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Row(
                  children: const [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Positions',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Balance',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Orders',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Impact Lens',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(color: Colors.grey.shade700, height: 0),
              TableWidget(),
              Divider(color: Colors.grey.shade700, height: 0),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Cash Balanece",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.question_mark, color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "USD Cash",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "5.09K",
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "(Market Value)",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "TOTAL Cash",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "5.09K",
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "(Market Value)",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
