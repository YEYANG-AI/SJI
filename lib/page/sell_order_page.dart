import 'package:bitkub/page/buy_order_page.dart';
import 'package:bitkub/widget/option_selector_overlay.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SellOrderPage extends StatefulWidget {
  const SellOrderPage({super.key});

  @override
  State<SellOrderPage> createState() => _SellOrderPageState();
}

class _SellOrderPageState extends State<SellOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.orange.shade800,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.close, size: 30, color: Colors.white),
        ),
        title: Row(
          children: [
            OptionSelectorOverlay(
              options: {
                "Buy Order": BuyOrderPage(),
                "Sell Order": SellOrderPage(),
              },
              initialOption: "Sell Order",
              onSelected: (option) {
                print("Selected option: $option");
              },
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, size: 30, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications, size: 30, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Account",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ],
            ),
            Divider(color: Colors.grey.shade700),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Row(
            //       children: [
            //         Text(
            //           "AAPL",
            //           style: TextStyle(color: Colors.white, fontSize: 20),
            //         ),
            //         SizedBox(width: 5),
            //         Text("NASDAQ.NMS", style: TextStyle(color: Colors.grey)),
            //       ],
            //     ),
            //     Row(
            //       children: [
            //         Column(
            //           children: [
            //             Text(
            //               "232.95 x 100",
            //               style: TextStyle(color: Colors.white, fontSize: 20),
            //             ),
            //             Text(
            //               "+0.17 +0.07%",
            //               style: TextStyle(color: Colors.green, fontSize: 20),
            //             ),
            //             Row(
            //               children: [
            //                 Icon(Icons.flag, color: Colors.red),
            //                 Icon(Icons.flag, color: Colors.yellow),
            //               ],
            //             ),
            //           ],
            //         ),
            //         Expanded(
            //           flex: 1,
            //           child: Column(
            //             children: [
            //               Text(
            //                 "Ask",
            //                 style: TextStyle(color: Colors.red, fontSize: 20),
            //               ),
            //               Text(
            //                 "Bid",
            //                 style: TextStyle(color: Colors.blue, fontSize: 20),
            //               ),
            //               Text(
            //                 "Spread",
            //                 style: TextStyle(color: Colors.grey, fontSize: 20),
            //               ),
            //             ],
            //           ),
            //         ),
            //         Expanded(
            //           flex: 1,
            //           child: Column(
            //             children: [
            //               Text(
            //                 "300 x 233.02",
            //                 style: TextStyle(color: Colors.red, fontSize: 20),
            //               ),
            //               Text(
            //                 "100 x 232.86",
            //                 style: TextStyle(color: Colors.blue, fontSize: 20),
            //               ),
            //               Text(
            //                 "0.16(0.069%)",
            //                 style: TextStyle(
            //                   color: Colors.grey.shade400,
            //                   fontSize: 20,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //     Container(
            //       height: 30,
            //       width: double.infinity,
            //       decoration: BoxDecoration(color: Colors.grey.shade900),
            //       child: Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 20),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Row(
            //               children: [
            //                 Container(
            //                   height: 20,
            //                   width: 20,
            //                   decoration: BoxDecoration(
            //                     shape: BoxShape.circle,
            //                     border: Border.all(
            //                       color: Colors.grey,
            //                       width: 1,
            //                     ),
            //                   ),
            //                   child: Center(
            //                     child: Text(
            //                       "i",
            //                       style: TextStyle(
            //                         color: Colors.grey,
            //                         fontSize: 12,
            //                         fontWeight: FontWeight.bold,
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //                 SizedBox(width: 10),
            //                 Text(
            //                   "consolidate snapshot",
            //                   style: TextStyle(color: Colors.grey.shade300),
            //                 ),
            //               ],
            //             ),
            //             Row(
            //               children: [
            //                 Text(
            //                   "As of 10:00:20 GMT+7",
            //                   style: TextStyle(color: Colors.grey),
            //                 ),
            //                 SizedBox(width: 10),
            //                 Icon(Icons.timelapse, color: Colors.grey),
            //               ],
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),

            //Table
            Table(
              border: TableBorder(
                horizontalInside: BorderSide(
                  color: Colors.grey.shade700,
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
              columnWidths: const {
                0: FlexColumnWidth(2), // Column 1
                1: FlexColumnWidth(2), // Column 2
                2: FlexColumnWidth(1), // Column 3
                3: IntrinsicColumnWidth(), // Column 4 (actions)
              },
              children: [
                // First Row
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Account",
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                          Text("UserID", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Available",
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                          Text("11.6k", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Position",
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                          Text("40", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey.shade700,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // Second Row
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "quantity",
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "100",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Text("23.6k", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(LucideIcons.minus, color: Colors.grey.shade700),
                          const SizedBox(width: 20),
                          Icon(LucideIcons.plus, color: Colors.grey.shade700),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey.shade700,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // third row
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: const Text(
                        "Order type",
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: const Text(
                        "Limit",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: const SizedBox(),
                    ), // empty cell (aligns with "Position")
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),

                // fourth Row
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "limit price",
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "233.03",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(LucideIcons.minus, color: Colors.grey.shade700),
                          const SizedBox(width: 20),
                          Icon(LucideIcons.plus, color: Colors.grey.shade700),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey.shade700,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // fifth row
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: const Text(
                        "Time in force",
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: const Text(
                        "Day",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: const SizedBox(),
                    ), // empty cell (aligns with "Position")
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),

                // sixth row
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: const Text(
                        "Display Size",
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: const SizedBox(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(LucideIcons.minus, color: Colors.grey.shade700),
                          const SizedBox(width: 20),
                          Icon(LucideIcons.plus, color: Colors.grey.shade700),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),

                // seventh row
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: const Text(
                        "Outside RTH",
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: 20,
                        width: 20,
                        child: Center(
                          child: Text(
                            'Off',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Icon(
                        Icons.info_outline,
                        color: Colors.grey.shade700,
                        size: 25,
                      ),
                    ),
                  ],
                ),

                // seventh row
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: const Text(
                        "Price Management Algo",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: 20,
                        width: 20,
                        child: Center(
                          child: Text(
                            'Off',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Icon(
                        Icons.info_outline,
                        color: Colors.grey.shade700,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                print("==> Buy");
              },
              child: Container(
                height: 100,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.blue.shade900,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "Buy",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
