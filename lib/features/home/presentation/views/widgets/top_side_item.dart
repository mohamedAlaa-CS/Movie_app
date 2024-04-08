import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/constants.dart';
import 'package:movie/core/widget/custom_cached_network_image.dart';
import 'package:movie/models/movie_model.dart';

import '../../../../../core/utils/color.dart';

class TopSideItem extends StatelessWidget {
  final void Function() onTap;
  final MovieModel model;
  final int index;
  final bool checked;
  const TopSideItem(
      {super.key,
      required this.model,
      required this.checked,
      required this.onTap,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: CustomCachedNetworkImage(
            imageUrl: '$apiImage${model.backdropPath ?? model.posterPath}',
            height: 150.h,
            width: double.infinity,
          ),
        ),
        Positioned(
          left: 19.w,
          top: 60.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              children: [
                Hero(
                  tag: 'herotop$index',
                  child: CustomCachedNetworkImage(
                    imageUrl: '$apiImage${model.posterPath}',
                    height: 130.h,
                    width: 90.w,
                  ),
                ),
                Image(
                  image: const AssetImage('assets/images/bookmark_add.png'),
                  color: checked ? kPrimaryColor : const Color(0xff514F4F),
                ),
                InkWell(
                  onTap: onTap,
                  child: Icon(
                    checked ? Icons.check : Icons.add,
                    color: Colors.white,
                    size: 22.sp,
                  ),
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
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        )
      ],
    );
  }
}
