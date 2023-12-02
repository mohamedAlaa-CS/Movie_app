import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/widget/custom_cached_network_image.dart';

class SearchListViewItem extends StatelessWidget {
  const SearchListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Row(
        children: [
          CustomCachedNetworkImage(
              imageUrl:
                  'https://images.pexels.com/photos/36753/flower-purple-lical-blosso.jpg',
              height: 89.h,
              width: 140.w),
          SizedBox(
            width: media.width / 35,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Alita Battle Angel',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: media.height / 110),
              Text(
                '2019',
                style: TextStyle(fontSize: 12.sp),
              ),
              SizedBox(height: media.height / 150),
              SizedBox(
                width: media.width / 1.8,
                child: Text(
                  'Rosa Salazar, Christoph Waltz',
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
