import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/constants.dart';
import 'package:movie/features/home/data/model/popular_model.dart';

import '../../../../../core/utils/color.dart';

class TopSideItem extends StatelessWidget {
  const TopSideItem({super.key, required this.model});
  final PopularModel model;
  final bool checked = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image(
            image: NetworkImage('$apiImage${model.posterPath}'),
            height: 150.h,
            width: double.infinity,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
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
                  image: NetworkImage('$apiImage${model.posterPath}'),
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
          left: 125.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.7,
                child: Text(
                  model.title ?? '',
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 120.h),
              Text(
                model.releaseDate ?? '',
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        )
      ],
    );
  }
}
