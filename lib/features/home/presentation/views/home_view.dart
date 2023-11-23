import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/features/home/presentation/views/widgets/new_relase_section.dart';
import 'package:movie/features/home/presentation/views/widgets/recomended_section.dart';
import 'package:movie/features/home/presentation/views/widgets/top_side_item.dart';

class HomeView extends StatelessWidget {
  static const String routeName = '/home_view';

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            items: const [
              TopSideItem(),
              TopSideItem(),
              TopSideItem(),
            ],
            options: CarouselOptions(
              height: 194.0.h,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16.w / 9.h,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.88,
            ),
          ),
          SizedBox(height: media.height / 40),
          const NewRelaseSection(),
          SizedBox(height: media.height / 50),
          const RecomendedSection()
        ],
      ),
    );
  }
}
