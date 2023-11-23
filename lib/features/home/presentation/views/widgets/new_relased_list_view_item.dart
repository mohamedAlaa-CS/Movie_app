import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/color.dart';

import '../../../../../core/utils/assets.dart';

class NewsRelaseListViewItem extends StatelessWidget {
  final bool checked = false;

  const NewsRelaseListViewItem({super.key});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
    );
  }
}
