import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/assets.dart';

class BrawserGrideViewItem extends StatelessWidget {
  const BrawserGrideViewItem({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      width: 158.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        image: const DecorationImage(
            image: AssetImage(Assets.backGroundBrawserImage),
            fit: BoxFit.cover),
      ),
      child: Center(
          child: Text(
        name,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
      )),
    );
  }
}
