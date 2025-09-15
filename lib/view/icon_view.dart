import 'package:flutter/material.dart';

class IconView extends StatefulWidget {
  const IconView({super.key});

  @override
  State<IconView> createState() => _IconViewState();
}

class _IconViewState extends State<IconView> {
  List<dynamic> imageIcon = [
    {"image": "assets/icons/walletPlus.png", "name": "ฝากTHB"},
    {"image": "assets/icons/wallet.png", "name": "ถอนTHB"},
    {"image": "assets/icons/bitcoin.png", "name": "ชื้อ/ขาย"},
    {"image": "assets/icons/addFriend.png", "name": "ชวนเพื่อน"},
  ];
  List<dynamic> image = [
    {"image": "assets/icons/bitkub.jpg", "name": "bitkub"},
    {"image": "assets/icons/newspaper.png", "name": "ข่าว"},
    {"image": "assets/icons/kub.png", "name": "ใช้ KUB"},
    {"image": "assets/icons/service.png", "name": "ช่วยเหลือ"},
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...imageIcon.map((item) {
                    return Column(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.grey.shade700,
                                Colors.grey.shade900,
                              ],
                            ),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            item['image'],
                            width: 30,
                            height: 30,
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          width: 80,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Center(
                            child: Text(
                              item['name'],
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...image.map((item) {
                    return Column(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.grey.shade700,
                                Colors.grey.shade900,
                              ],
                            ),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            item['image'],
                            width: 30,
                            height: 30,
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          width: 80,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Center(
                            child: Text(
                              item['name'],
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
