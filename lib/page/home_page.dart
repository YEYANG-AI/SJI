import 'package:bitkub/page/stock_chart.dart';
import 'package:bitkub/page/menu_appbar.dart';
import 'package:bitkub/view/banner_widget.dart';
import 'package:bitkub/view/board_view.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool iselected = false;
  bool _obscure = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: MenuAppbar(
          obscure: _obscure,
          onToggleObscure: () {
            setState(() {
              _obscure = !_obscure;
            });
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Value",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "|",
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Performance",
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                    ],
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.orangeAccent, width: 2),
                    ),
                    child: Center(
                      child: Text(
                        "i",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _obscure ? "******" : "\$5,086.25",
                        style: TextStyle(color: Colors.green, fontSize: 30),
                      ),
                      Row(
                        children: [
                          Text(
                            _obscure ? "******" : "\$5,086.25(∞%)",
                            style: TextStyle(color: Colors.green, fontSize: 20),
                          ),
                          Text(
                            " past year",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Center(child: StockChart()),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.orangeAccent,
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        LucideIcons
                            .plus, // เปลี่ยนจาก LucideIcons.plus เป็น Icons.add
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Colors.orangeAccent,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            LucideIcons.search,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "PortfolioAnalyst",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Colors.orangeAccent,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.history, color: Colors.white, size: 20),
                          SizedBox(width: 10),
                          Text(
                            "Transactions",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              // Container(
              //   height: 150,
              //   width: double.infinity,
              //   color: Colors.white,
              //   child: Column(
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Container(
              //             height: 120,
              //             width: 200,
              //             margin: const EdgeInsets.only(left: 10),
              //             child: Text(
              //               "Will August 2025 be the warmest August on record?",
              //               style: TextStyle(
              //                 color: Colors.black,
              //                 fontSize: 20,
              //                 fontWeight: FontWeight.bold,
              //               ),
              //             ),
              //           ),
              //           Container(
              //             height: 120,
              //             width: 200,
              //             child: Column(
              //               children: [
              //                 Row(
              //                   children: [
              //                     TextButton(
              //                       onPressed: () {},
              //                       child: Container(
              //                         alignment: Alignment.center,
              //                         // margin: EdgeInsets.all(10),
              //                         height: 70,
              //                         width: 70,
              //                         decoration: BoxDecoration(
              //                           border: Border.all(
              //                             color: Colors.green,
              //                             width: 4,
              //                           ),
              //                         ),
              //                         child: Padding(
              //                           padding: const EdgeInsets.only(top: 5),
              //                           child: Column(
              //                             children: [
              //                               Text(
              //                                 "YES",
              //                                 style: TextStyle(
              //                                   color: Colors.green,
              //                                   fontSize: 25,
              //                                 ),
              //                               ),
              //                               Text(
              //                                 "(15%)",
              //                                 style: TextStyle(
              //                                   color: Colors.green,
              //                                   fontSize: 12,
              //                                 ),
              //                               ),
              //                             ],
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                     TextButton(
              //                       onPressed: () {},
              //                       child: Container(
              //                         alignment: Alignment.center,
              //                         // margin: EdgeInsets.all(10),
              //                         height: 70,
              //                         width: 70,
              //                         decoration: BoxDecoration(
              //                           border: Border.all(
              //                             color: Colors.red,
              //                             width: 4,
              //                           ),
              //                         ),
              //                         child: Padding(
              //                           padding: const EdgeInsets.only(top: 5),
              //                           child: Column(
              //                             children: [
              //                               Text(
              //                                 "NO",
              //                                 style: TextStyle(
              //                                   color: Colors.red,
              //                                   fontSize: 25,
              //                                 ),
              //                               ),
              //                               Text(
              //                                 "(85%)",
              //                                 style: TextStyle(
              //                                   color: Colors.red,
              //                                   fontSize: 12,
              //                                 ),
              //                               ),
              //                             ],
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //                 Text(
              //                   "You can trade your prediction today",
              //                   style: TextStyle(
              //                     color: Colors.black,
              //                     fontSize: 10,
              //                     fontWeight: FontWeight.bold,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ],
              //       ),
              //       Container(
              //         margin: const EdgeInsets.only(left: 10, right: 10),
              //         height: 30,
              //         width: double.infinity,
              //         child: Text(
              //           "worst soon comes vertue toned no tell to diroor BeGuNG Oetca1h-208uko3180 9980.009968 and do net refect mariet sentiment or topectes culcomes.",
              //           style: TextStyle(
              //             color: Colors.black,
              //             fontSize: 8,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // Container(
                    //   height: 100,
                    //   width: 100,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     color: Colors.grey.shade800,
                    //   ),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Container(
                    //         decoration: BoxDecoration(
                    //           shape: BoxShape.circle,
                    //           color: Colors.orange,
                    //         ),
                    //         child: Icon(
                    //           LucideIcons.arrowRight,
                    //           color: Colors.black,
                    //         ),
                    //       ),
                    //       Text(
                    //         "For you",
                    //         style: TextStyle(color: Colors.white),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(width: 10),
                    // Container(
                    //   height: 100,
                    //   width: 260,
                    //   padding: EdgeInsets.symmetric(horizontal: 20),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     color: Colors.grey.shade800,
                    //   ),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Text(
                    //         "you have 1 pending request to provide information",
                    //         style: TextStyle(color: Colors.white),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(width: 10),
                    // Container(
                    //   height: 100,
                    //   width: 250,
                    //   padding: EdgeInsets.symmetric(horizontal: 20),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     color: Colors.grey.shade800,
                    //   ),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Text(
                    //         "you have 1 pending request to provide information",
                    //         style: TextStyle(color: Colors.white),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),

              Column(children: [BannerWidget(), BoardView()]),
            ],
          ),
        ),
      ),
      //bottomNavigationBar: BottomView(),
    );
  }
}
