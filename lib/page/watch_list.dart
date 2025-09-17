import 'package:bitkub/page/menu_appbar.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class WatchList extends StatefulWidget {
  const WatchList({super.key});

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  final List<Map<String, dynamic>> tableData = [
    {
      "image": "assets/images/apple_logo.jpg",
      "name": "AAPL",
      "last": "6374.49",
      "chng": "+5.04",
      "chg%": "4.02%",
      "volume": "",
    },
    {
      "image": "assets/images/amzn.png",
      "name": "AMZN",
      "last": "6374.49",
      "chng": "+2.04",
      "chg%": "1.02%",
      "volume": "150M",
    },
    {
      "image": "assets/images/apple_logo.jpg",
      "name": "NASDAQ",
      "last": "15542.10",
      "chng": "-2.15",
      "chg%": "-0.04%",
      "volume": "120M",
    },
  ];

  final List<dynamic> headers = [
    {
      "image": "assets/images/apple_logo.jpg",
      "name": "AAPL",
      "discription": "Apple Inc",
    },
    {
      "image": "assets/images/amzn.png",
      "name": "AMZN",
      "discription": "AMAZON.COM, INC.",
    },
    {
      "image": "assets/images/figma.png",
      "name": "FIG",
      "discription": "FIGMA INC-CLA",
    },
    {
      "image": "assets/images/apple_logo.jpg",
      "name": "AAPL",
      "discription": "Apple Inc",
    },
    {
      "image": "assets/images/amzn.png",
      "name": "AMZN",
      "discription": "AMAZON.COM, INC.",
    },
    {
      "image": "assets/images/figma.png",
      "name": "FIG",
      "discription": "FIGMA INC-CLA",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: MenuAppbar(),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Row(
                  children: const [
                    Icon(LucideIcons.plus, size: 30, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      "Favorite",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(color: Colors.grey, height: 2),

              // Header row
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 8,
                      ),
                      child: Row(
                        children: const [
                          Expanded(
                            flex: 2,
                            child: Text(
                              'INSTRUMENT',
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
                              'LAST',
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
                              'CHNG',
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
                              'CHG %',
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
                              'VOLUME',
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
                    const Divider(color: Colors.grey, height: 2),
                    Expanded(
                      child: ListView.builder(
                        itemCount: tableData.length,
                        itemBuilder: (context, index) {
                          final item = tableData[index];
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/analysis',
                                arguments: item['name'],
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 8,
                              ),
                              // decoration: BoxDecoration(
                              //   border: Border(
                              //     bottom: BorderSide(color: Colors.grey.shade300),
                              //   ),
                              // ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          item["image"].toString(),
                                          width: 40,
                                          height: 40,
                                        ),
                                        Text(
                                          item["name"].toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      item["last"].toString(),
                                      style: const TextStyle(
                                        backgroundColor: Color.fromARGB(
                                          255,
                                          99,
                                          77,
                                          9,
                                        ),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      item["chng"].toString(),
                                      style: TextStyle(
                                        backgroundColor:
                                            item["chg%"].toString().startsWith(
                                              '+',
                                            )
                                            ? const Color.fromARGB(
                                                255,
                                                17,
                                                53,
                                                20,
                                              )
                                            : item["chg%"]
                                                  .toString()
                                                  .startsWith('-')
                                            ? const Color.fromARGB(
                                                255,
                                                87,
                                                10,
                                                10,
                                              )
                                            : const Color.fromARGB(
                                                255,
                                                17,
                                                53,
                                                20,
                                              ),
                                        color:
                                            item["chng"].toString().startsWith(
                                              '+',
                                            )
                                            ? Colors.green
                                            : item["chng"]
                                                  .toString()
                                                  .startsWith('-')
                                            ? Colors.red
                                            : Colors.green,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      item["chg%"].toString(),
                                      style: TextStyle(
                                        backgroundColor:
                                            item["chg%"].toString().startsWith(
                                              '+',
                                            )
                                            ? const Color.fromARGB(
                                                255,
                                                17,
                                                53,
                                                20,
                                              )
                                            : item["chg%"]
                                                  .toString()
                                                  .startsWith('-')
                                            ? const Color.fromARGB(
                                                255,
                                                87,
                                                10,
                                                10,
                                              )
                                            : const Color.fromARGB(
                                                255,
                                                17,
                                                53,
                                                20,
                                              ),
                                        fontSize: 14,
                                        color:
                                            item["chg%"].toString().startsWith(
                                              '+',
                                            )
                                            ? Colors.green
                                            : item["chg%"]
                                                  .toString()
                                                  .startsWith('-')
                                            ? Colors.red
                                            : Colors.green,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      item["volume"].toString(),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        backgroundColor: Color.fromARGB(
                                          255,
                                          99,
                                          77,
                                          9,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Divider(color: Colors.grey, height: 2),
              SizedBox(height: 10),
              Text(
                'List',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     Row(
              //       children: [
              //         Container(
              //           height: 60,
              //           width: 60,
              //           decoration: BoxDecoration(
              //             color: Colors.white,
              //             borderRadius: BorderRadius.circular(10),
              //           ),
              //           child: Padding(
              //             padding: const EdgeInsets.all(2),
              //             child: ClipRRect(
              //               borderRadius: BorderRadius.circular(60),
              //               child: Image.asset('assets/images/apple_logo.jpg'),
              //             ),
              //           ),
              //         ),
              //         SizedBox(width: 10),
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               "AAPL",
              //               style: TextStyle(
              //                 color: Colors.white,
              //                 fontWeight: FontWeight.bold,
              //               ),
              //             ),
              //             Text(
              //               "apple inc",
              //               style: TextStyle(color: Colors.white),
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: GridView.count(
                  childAspectRatio: 3,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  children: headers.map((item) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/analysis',
                          arguments: item['name'],
                        );
                      },
                      child: Container(
                        //margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade900,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(60),
                                  child: Image.asset(
                                    item['image'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: Text(
                                    item['name'],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                                SizedBox(
                                  child: Text(
                                    item['discription'],
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 10,
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
