import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/constants.dart';
import 'package:movie/core/widget/custom_cached_network_image.dart';
import 'package:movie/models/movie_model.dart';

class SearchListViewItem extends StatelessWidget {
  const SearchListViewItem({super.key, required this.model});
  final MovieModel model;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Row(
        children: [
          CustomCachedNetworkImage(
            imageUrl: '$apiImage${model.posterPath}',
            height: 89.h,
            width: 100.w,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: media.width / 1.7,
                ),
                child: Text(
                  model.title ?? '',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                model.releaseDate ?? '',
                style: TextStyle(fontSize: 12.sp),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 5),
              Container(
                constraints: BoxConstraints(
                  maxWidth: media.width / 1.7,
                ),
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
