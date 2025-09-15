import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final List<String> data = [
    "assets/images/WorldTrade.jpg",
    "assets/images/FastTrade.jpg",
    "assets/images/Trade.jpg",
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider.builder(
          itemCount: data.length,
          itemBuilder: (context, index, realIdx) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                data[index],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            );
          },
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            autoPlayInterval: const Duration(seconds: 3),
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
            height: 160,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(data.length, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: index == currentIndex ? 30 : 10,
              height: 5,
              decoration: BoxDecoration(
                color: index == currentIndex
                    ? Colors.orangeAccent
                    : Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
            );
          }),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
