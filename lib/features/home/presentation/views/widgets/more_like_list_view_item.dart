import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/constants.dart';
import 'package:movie/core/widget/custom_cached_network_image.dart';
import 'package:movie/features/home/data/model/similar_movie.dart';

import '../../../../../core/utils/color.dart';
import 'custom_movie_rate.dart';

class MoreLikeListViewItem extends StatelessWidget {
  const MoreLikeListViewItem(
      {super.key,
      required this.model,
      required this.checked,
      required this.ontap,
      required this.index});
  final SimilarMovieModel model;
  final bool checked;
  final void Function() ontap;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 90.w,
          decoration: BoxDecoration(
            color: const Color(0xff343534),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                  child: CustomCachedNetworkImage(
                    height: 95.h,
                    width: 105.w,
                    imageUrl:
                        '$apiImage${model.posterPath ?? model.backdropPath ?? 'https://cdn0.iconfinder.com/data/icons/shift-interfaces/32/Error-512.png'}',
                  )),
              SizedBox(
                height: 3.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomMovieRate(rate: '${model.voteAverage ?? ''}'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(
                        model.title ?? '',
                        style: TextStyle(
                            fontSize: 11.sp, fontWeight: FontWeight.w500),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      model.releaseDate ?? '',
                      style: TextStyle(fontSize: 10.sp),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Image(
          image: const AssetImage('assets/images/bookmark_add.png'),
          color: checked ? kPrimaryColor : const Color(0xff514F4F),
        ),
        InkWell(
          onTap: ontap,
          child: Icon(
            checked ? Icons.check : Icons.add,
            color: Colors.white,
            size: 22.sp,
          ),
        )
      ],
    );
  }
}
