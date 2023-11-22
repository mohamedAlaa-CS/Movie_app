import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie/features/home/presentation/views/widgets/top_side_item.dart';

class HomeView extends StatelessWidget {
  static const String routeName = '/home_view';

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CarouselSlider(
            items: const [
              TopSideItem(),
              TopSideItem(),
              TopSideItem(),
            ],
            options: CarouselOptions(
              height: 500.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}
