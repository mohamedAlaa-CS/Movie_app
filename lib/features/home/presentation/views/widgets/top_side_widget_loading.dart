import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class TopSideWidgetLoading extends StatelessWidget {
  const TopSideWidgetLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Shimmer.fromColors(
          baseColor: Colors.white,
          highlightColor: Colors.grey,
          child: Stack(
            children: [
              Container(
                height: 150.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              Positioned(
                left: 19.w,
                top: 60.h,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey,
                    border: Border.all(width: 2, color: Colors.black),
                  ),
                  height: 130.h,
                  width: 90.w,
                ),
              ),
            ],
          )),
    );
  }
}
