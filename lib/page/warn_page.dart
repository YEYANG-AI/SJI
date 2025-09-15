import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class WarnPage extends StatelessWidget {
  const WarnPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> texts = [
      "เวอร์ชั่น 1.0.0 ยังไม่สามารถใช้งานได้",
      "ปิดปรับปรุงระบบถอนเหรียญ WLD บนเครือข่าย Optimism ชั่วคราว วันที่ 07/08/68, 9:30 น. เป็นต้นไป ขออภัยในความไม่สะดวก",
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Icon(Icons.volume_up, color: Colors.orange, size: 20),
          SizedBox(width: 5),
          Expanded(
            child: CarouselSlider.builder(
              itemCount: texts.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    texts[index],
                    style: TextStyle(color: Colors.orange),
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
    );
  }
}
