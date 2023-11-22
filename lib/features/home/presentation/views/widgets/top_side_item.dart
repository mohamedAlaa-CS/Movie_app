import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/color.dart';

class TopSideItem extends StatelessWidget {
  const TopSideItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image(
            image: const AssetImage(Assets.testImage),
            height: 170.sp,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 19.sp,
          top: 70.sp,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              children: [
                Image(
                  image: const AssetImage(Assets.testImage),
                  height: 140.sp,
                  width: 90.sp,
                  fit: BoxFit.cover,
                ),
                Icon(
                  FontAwesomeIcons.solidBookmark,
                  color: kbookMarkColor,
                  size: 26.sp,
                ),
                Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 22.sp,
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 175.sp,
          left: 117.sp,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Dora and the lost city of gold'),
              Text('2019  PG-13  2h 7m'),
            ],
          ),
        )
      ],
    );
  }
}
