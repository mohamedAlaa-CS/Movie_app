import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/color.dart';

class CustomMovieRate extends StatelessWidget {
  const CustomMovieRate({super.key, required this.rate});
  final String rate;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: kPrimaryColor,
          size: 21.sp,
        ),
        SizedBox(
          width: 4.w,
        ),
        Text(
          rate,
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
