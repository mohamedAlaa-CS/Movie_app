import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        enabled: true,
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 5),
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey,
              ),
              width: 90.w,
              height: 130.h,
            );
          },
        ));
  }
}
