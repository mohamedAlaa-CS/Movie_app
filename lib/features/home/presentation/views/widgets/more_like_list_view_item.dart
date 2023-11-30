import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/widget/custom_cached_network_image.dart';

import '../../../../../core/utils/color.dart';
import 'custom_movie_rate.dart';

class MoreLikeListViewItem extends StatelessWidget {
  const MoreLikeListViewItem({super.key});

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
                        'https://img.freepik.com/free-photo/purple-osteospermum-daisy-flower_1373-16.jpg',
                  )),
              SizedBox(
                height: 3.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomMovieRate(rate: '7.7'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(
                        'Deadpool 2',
                        style: TextStyle(
                            fontSize: 11.sp, fontWeight: FontWeight.w500),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '2018  R  1h 59m',
                      style: TextStyle(fontSize: 10.sp),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const Image(
          image: AssetImage('assets/images/bookmark_add.png'),
          color: true ? kPrimaryColor : Color(0xff514F4F),
        ),
        InkWell(
          onTap: () {},
          child: Icon(
            true ? Icons.check : Icons.add,
            color: Colors.white,
            size: 22.sp,
          ),
        )
      ],
    );
  }
}
