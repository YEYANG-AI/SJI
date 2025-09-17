import 'package:bitkub/page/buy_order_page.dart';
import 'package:bitkub/page/menu_appbar.dart';
import 'package:bitkub/widget/option_selector_overlay.dart';
import 'package:bitkub/widget/balance_widget.dart';
import 'package:bitkub/widget/show_search_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class TradePage extends StatefulWidget {
  const TradePage({super.key});

  @override
  State<TradePage> createState() => _TradePageState();
}

class _TradePageState extends State<TradePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: MenuAppbar(showSearchIcon: false),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 10),
                Text(
                  'Trade',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            //search
            // Container(
            //   margin: EdgeInsets.all(10),
            //   height: 50,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     color: Colors.grey.shade800,
            //     borderRadius: BorderRadius.circular(20),
            //   ),
            //   child: TextField(
            //     controller: _searchController,
            //     autofocus: true,
            //     decoration: InputDecoration(
            //       prefixIcon: Icon(Icons.search, color: Colors.white, size: 30),
            //       contentPadding: EdgeInsets.symmetric(vertical: 8),
            //       hintText: "Search stocks,ETFS & More",
            //       hintStyle: TextStyle(color: Colors.white),
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(10),
            //         borderSide: BorderSide.none,
            //       ),
            //     ),
            //     style: TextStyle(color: Colors.white, fontSize: 18),
            //     cursorColor: Colors.white,
            //   ),
            // ),
            SizedBox(child: ShowSearchItemWidget()),
            Divider(color: Colors.grey, height: 20),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "10",
                        style: TextStyle(color: Colors.green, fontSize: 20),
                      ),
                      Text('orders', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  SizedBox(width: 10),
                  Text('/', style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Text(
                        "6",
                        style: TextStyle(color: Colors.green, fontSize: 20),
                      ),
                      Text('Trades', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  SizedBox(width: 10),
                  Text('/', style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Text(
                        "2",
                        style: TextStyle(color: Colors.green, fontSize: 20),
                      ),
                      Text('Recurring', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey, height: 20),

            Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      // Container(
                      //   padding: EdgeInsets.all(8),
                      //   height: 200,
                      //   width: 120,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     border: Border.all(color: Colors.grey.shade700),
                      //   ),
                      //   child: Column(
                      //     children: [
                      //       Row(
                      //         mainAxisAlignment:
                      //             MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Icon(
                      //             Icons.timelapse,
                      //             size: 18,
                      //             color: Colors.amberAccent,
                      //           ),
                      //           Text(
                      //             'NYSE',
                      //             style: TextStyle(
                      //               color: Colors.white,
                      //               fontSize: 12,
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //       SizedBox(height: 40),
                      //       Text(
                      //         'Wave',
                      //         style: TextStyle(color: Colors.white),
                      //       ),
                      //       SizedBox(height: 40),
                      //       Text(
                      //         'QBTS',
                      //         style: TextStyle(color: Colors.white),
                      //       ),
                      //       Text(
                      //         '17.42',
                      //         style: TextStyle(color: Colors.white),
                      //       ),
                      //       Container(
                      //         padding: EdgeInsets.symmetric(horizontal: 10),
                      //         decoration: BoxDecoration(
                      //           color: Colors.green.shade900,
                      //           borderRadius: BorderRadius.circular(10),
                      //         ),
                      //         child: Text(
                      //           '+0.29%',
                      //           style: TextStyle(color: Colors.greenAccent),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(width: 10),
                      // Container(
                      //   padding: EdgeInsets.all(8),
                      //   height: 200,
                      //   width: 120,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     border: Border.all(color: Colors.grey.shade700),
                      //   ),
                      //   child: Column(
                      //     children: [
                      //       Row(
                      //         mainAxisAlignment:
                      //             MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Icon(
                      //             Icons.timelapse,
                      //             size: 18,
                      //             color: Colors.amberAccent,
                      //           ),
                      //           Text(
                      //             'NYSE',
                      //             style: TextStyle(
                      //               color: Colors.white,
                      //               fontSize: 12,
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //       SizedBox(height: 40),
                      //       Text(
                      //         'Wave',
                      //         style: TextStyle(color: Colors.white),
                      //       ),
                      //       SizedBox(height: 40),
                      //       Text(
                      //         'QBTS',
                      //         style: TextStyle(color: Colors.white),
                      //       ),
                      //       Text(
                      //         '17.42',
                      //         style: TextStyle(color: Colors.white),
                      //       ),
                      //       Container(
                      //         padding: EdgeInsets.symmetric(horizontal: 10),
                      //         decoration: BoxDecoration(
                      //           color: Colors.green.shade900,
                      //           borderRadius: BorderRadius.circular(10),
                      //         ),
                      //         child: Text(
                      //           '+0.29%',
                      //           style: TextStyle(color: Colors.greenAccent),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(width: 10),
                      // Container(
                      //   padding: EdgeInsets.all(8),
                      //   height: 200,
                      //   width: 120,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     border: Border.all(color: Colors.grey.shade700),
                      //   ),
                      //   child: Column(
                      //     children: [
                      //       Row(
                      //         mainAxisAlignment:
                      //             MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Icon(
                      //             Icons.timelapse,
                      //             size: 18,
                      //             color: Colors.amberAccent,
                      //           ),
                      //           Text(
                      //             'NYSE',
                      //             style: TextStyle(
                      //               color: Colors.white,
                      //               fontSize: 12,
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //       SizedBox(height: 40),
                      //       Text(
                      //         'Wave',
                      //         style: TextStyle(color: Colors.white),
                      //       ),
                      //       SizedBox(height: 40),
                      //       Text(
                      //         'QBTS',
                      //         style: TextStyle(color: Colors.white),
                      //       ),
                      //       Text(
                      //         '17.42',
                      //         style: TextStyle(color: Colors.white),
                      //       ),
                      //       Container(
                      //         padding: EdgeInsets.symmetric(horizontal: 10),
                      //         decoration: BoxDecoration(
                      //           color: Colors.green.shade900,
                      //           borderRadius: BorderRadius.circular(10),
                      //         ),
                      //         child: Text(
                      //           '+0.29%',
                      //           style: TextStyle(color: Colors.greenAccent),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(width: 10),
                      // Container(
                      //   padding: EdgeInsets.all(8),
                      //   height: 200,
                      //   width: 120,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     border: Border.all(color: Colors.grey.shade700),
                      //   ),
                      //   child: Column(
                      //     children: [
                      //       Row(
                      //         mainAxisAlignment:
                      //             MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Icon(
                      //             Icons.timelapse,
                      //             size: 18,
                      //             color: Colors.amberAccent,
                      //           ),
                      //           Text(
                      //             'NYSE',
                      //             style: TextStyle(
                      //               color: Colors.white,
                      //               fontSize: 12,
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //       SizedBox(height: 40),
                      //       Text(
                      //         'Wave',
                      //         style: TextStyle(color: Colors.white),
                      //       ),
                      //       SizedBox(height: 40),
                      //       Text(
                      //         'QBTS',
                      //         style: TextStyle(color: Colors.white),
                      //       ),
                      //       Text(
                      //         '17.42',
                      //         style: TextStyle(color: Colors.white),
                      //       ),
                      //       Container(
                      //         padding: EdgeInsets.symmetric(horizontal: 10),
                      //         decoration: BoxDecoration(
                      //           color: Colors.green.shade900,
                      //           borderRadius: BorderRadius.circular(10),
                      //         ),
                      //         child: Text(
                      //           '+0.29%',
                      //           style: TextStyle(color: Colors.greenAccent),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      BalanceWidget(),
                    ],
                  ),
                ),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       Text(
            //         'Recently Viewed',
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 18,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      OptionSelectorOverlay(
                        options: {
                          "All": TradePage(),
                          "Favorite": TradePage(),
                          "Popular": TradePage(),
                        },
                        initialOption: "Favorite",
                        onSelected: (value) => print("Selected: $value"),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          height: 90,
                          width: 120,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.green.shade900,
                                Colors.transparent,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10),
                            //border: Border.all(color: Colors.grey.shade700),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'AAPL',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'NASDAQ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 9,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '+0.50%',
                                style: TextStyle(color: Colors.green),
                              ),
                              Text(
                                '6374.49',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          padding: EdgeInsets.all(8),
                          height: 90,
                          width: 120,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.green.shade900,
                                Colors.transparent,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10),
                            //border: Border.all(color: Colors.grey.shade700),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'SPX',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'CBOE',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 9,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '+0.02%',
                                style: TextStyle(color: Colors.green),
                              ),
                              Text(
                                '6374.49',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          padding: EdgeInsets.all(8),
                          height: 90,
                          width: 120,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.red.shade900, Colors.transparent],
                            ),
                            borderRadius: BorderRadius.circular(10),
                            //border: Border.all(color: Colors.grey.shade700),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'SPX',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'CBOE',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 9,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '-0.02%',
                                style: TextStyle(color: Colors.red),
                              ),
                              Text(
                                '6374.49',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          padding: EdgeInsets.all(8),
                          height: 90,
                          width: 120,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.green.shade900,
                                Colors.transparent,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10),
                            //border: Border.all(color: Colors.grey.shade700),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'SPX',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'CBOE',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 9,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '+0.02%',
                                style: TextStyle(color: Colors.green),
                              ),
                              Text(
                                '6374.49',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'ToolBox',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BuyOrderPage(),
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                height: 70,
                                width: 140,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Buy Order',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(
                                      LucideIcons.plusCircle,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              height: 70,
                              width: 140,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey.shade700),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Sell Order',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Icon(
                                    LucideIcons.minusCircle,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
