import 'package:bitkub/view/banner_widget.dart';
import 'package:bitkub/view/board_view.dart';
import 'package:bitkub/view/icon_view.dart';
import 'package:bitkub/widget/balance_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MenuIconsView extends StatefulWidget {
  const MenuIconsView({super.key});

  @override
  State<MenuIconsView> createState() => _MenuIconsViewState();
}

class _MenuIconsViewState extends State<MenuIconsView> {
  List<String> texts = [
    "update successfully",
    "ปิดปรับปรุงระบบถอนเหรียญ WLD บนเครือข่าย Optimism ชั่วคราว วันที่ 07/08/68, 9:30 น. เป็นต้นไป ขออภัยในความไม่สะดวก",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.grey.shade900,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: BalanceWidget(),
          ),
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.orange.shade700, Colors.orange.shade900],
                ),
              ),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Icon(
                                  Icons.person,
                                  size: 20,
                                  color: Colors.orange.shade700,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Register",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 10,
              right: 10,
              top: 60,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(children: [IconView()]),
              ),
            ),
          ],
        ),
        SizedBox(height: 170),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Icon(Icons.volume_up, color: Colors.grey, size: 20),
              SizedBox(width: 5),
              Expanded(
                child: CarouselSlider.builder(
                  itemCount: texts.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            texts[index],
                            style: TextStyle(color: Colors.grey),
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      },
                  options: CarouselOptions(
                    height: 40,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    scrollDirection: Axis.horizontal,
                    autoPlay: true,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        BannerWidget(),
        SizedBox(height: 0),
        BoardView(),
      ],
    );
  }
}
