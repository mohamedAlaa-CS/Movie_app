import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/color.dart';

class TopSideItem extends StatelessWidget {
  const TopSideItem({super.key});
  final bool checked = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image(
            image: const AssetImage(Assets.testImage),
            height: 150.h,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 19.w,
          top: 60.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              children: [
                Image(
                  image: const AssetImage(Assets.testImage),
                  height: 130.h,
                  width: 90.w,
                  fit: BoxFit.cover,
                ),
                Image(
                  image: const AssetImage('assets/images/bookmark_add.png'),
                  color: checked ? kPrimaryColor : const Color(0xff514F4F),
                ),
                Icon(
                  checked ? Icons.check : Icons.add,
                  color: Colors.white,
                  size: 22.sp,
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 155.h,
          left: 117.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dora and the lost city of gold',
                style: TextStyle(fontSize: 12.sp),
              ),
              Text(
                '2019  PG-13  2h 7m',
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        )
      ],
    );
  }
}
