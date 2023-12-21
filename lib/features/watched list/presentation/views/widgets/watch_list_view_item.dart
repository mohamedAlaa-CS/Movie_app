import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/widget/custom_cached_network_image.dart';

class WatchListListViewItem extends StatelessWidget {
  const WatchListListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Row(
            children: [
              CustomCachedNetworkImage(
                  imageUrl:
                      'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                  height: 89.h,
                  width: media.width / 3.1),
              SizedBox(
                width: media.width / 35,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: media.width / 2,
                    child: Text(
                      'hello',
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w500),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: media.height / 110),
                  Text(
                    'hello',
                    style: TextStyle(fontSize: 12.sp),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: media.height / 150),
                  SizedBox(
                    width: media.width / 2,
                    child: Text(
                      'hello',
                      style: TextStyle(fontSize: 12.sp),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              )
            ],
          ),
          const Image(image: AssetImage('assets/images/bookmark_add.png')),
          Positioned(
            left: 2.w,
            top: 2.h,
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 20.sp,
            ),
          )
        ],
      ),
    );
  }
}
