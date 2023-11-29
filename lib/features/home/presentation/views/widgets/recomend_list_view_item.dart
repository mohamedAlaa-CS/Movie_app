import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/constants.dart';
import 'package:movie/features/home/data/model/recomend_model.dart';
import 'package:movie/features/home/presentation/views/widgets/custom_movie_rate.dart';

import '../../../../../core/utils/color.dart';

class RecomendedListViewItem extends StatelessWidget {
  final void Function() onTap;
  final RecomendModel model;
  final bool checked;
  const RecomendedListViewItem(
      {super.key,
      required this.model,
      required this.checked,
      required this.onTap});

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
                  child: CachedNetworkImage(
                    height: 95.h,
                    width: 105.w,
                    imageUrl: '$apiImage${model.posterPath}',
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Center(child: Icon(Icons.error)),
                  )),
              SizedBox(
                height: 3.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomMovieRate(rate: '${model.voteAverage ?? 0.0}'),
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
          onTap: onTap,
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
