import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/color.dart';

class CustomTypeOfMovieDetails extends StatelessWidget {
  const CustomTypeOfMovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: SizedBox(
        height: 22.h,
        child: Container(
          width: 65.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              border: Border.all(color: kbookMarkColor)),
          child: const Center(child: Text('box')),
        ),
      ),
    );
  }
}
