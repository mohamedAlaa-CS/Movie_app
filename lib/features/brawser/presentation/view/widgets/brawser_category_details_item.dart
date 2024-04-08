import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/constants.dart';
import 'package:movie/core/widget/custom_cached_network_image.dart';
import 'package:movie/models/movie_model.dart';

class BrawserCategoryDetailsItem extends StatelessWidget {
  const BrawserCategoryDetailsItem({
    super.key,
    required this.model,
  });
  final MovieModel model;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Row(
        children: [
          CustomCachedNetworkImage(
              imageUrl: '$apiImage${model.backdropPath}',
              height: 89.h,
              width: 140.w),
          SizedBox(
            width: media.width / 35,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: media.width / 1.8,
                child: Text(
                  model.title ?? '',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: media.height / 110),
              Text(
                model.releaseDate ?? '',
                style: TextStyle(fontSize: 12.sp),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: media.height / 150),
              SizedBox(
                width: media.width / 1.8,
                child: Text(
                  model.overview ?? '',
                  style: TextStyle(fontSize: 12.sp),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
