import 'package:flutter/material.dart';

class TableWidget extends StatefulWidget {
  const TableWidget({super.key});

  @override
  State<TableWidget> createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  final List<Map<String, dynamic>> tableData = [
    {
      "name": "AAPL",
      "last": "6374.49",
      "chng": "+2.04",
      "chg%": "0.02%",
      "volume": "160M",
    },
    {
      "name": "SPX",
      "last": "6374.49",
      "chng": "+1.04",
      "chg%": "0.02%",
      "volume": "150M",
    },
    {
      "name": "NASDAQ",
      "last": "15542.10",
      "chng": "-2.15",
      "chg%": "-0.04%",
      "volume": "120M",
    },
    {
      "name": "NASDAQ",
      "last": "15542.10",
      "chng": "-1.15",
      "chg%": "-0.04%",
      "volume": "120M",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: Row(
              children: const [
                Expanded(
                  flex: 3,
                  child: Text(
                    'INSTRUMENT',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'LAST',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'CHNG',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'POS',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'P&L',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          Divider(color: Colors.grey.shade700, height: 0),
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
                      vertical: 6,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade700),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            item["name"].toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            item["last"].toString(),
                            style: const TextStyle(
                              backgroundColor: Color.fromARGB(255, 99, 77, 9),
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            item["chng"].toString(),
                            style: TextStyle(
                              backgroundColor:
                                  item["chg%"].toString().startsWith('+')
                                  ? const Color.fromARGB(255, 17, 53, 20)
                                  : item["chg%"].toString().startsWith('-')
                                  ? const Color.fromARGB(255, 87, 10, 10)
                                  : const Color.fromARGB(255, 17, 53, 20),
                              fontSize: 12,
                              color: item["chng"].toString().startsWith('+')
                                  ? Colors.green
                                  : item["chng"].toString().startsWith('-')
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
                                  item["chg%"].toString().startsWith('+')
                                  ? const Color.fromARGB(255, 17, 53, 20)
                                  : item["chg%"].toString().startsWith('-')
                                  ? const Color.fromARGB(255, 87, 10, 10)
                                  : const Color.fromARGB(255, 17, 53, 20),
                              fontSize: 12,
                              color: item["chg%"].toString().startsWith('+')
                                  ? Colors.green
                                  : item["chg%"].toString().startsWith('-')
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
                              fontSize: 12,
                              color: Colors.white,
                              backgroundColor: Color.fromARGB(255, 99, 77, 9),
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
          //Divider(color: Colors.grey.shade700, height: 0),
        ],
      ),
    );
  }
}
