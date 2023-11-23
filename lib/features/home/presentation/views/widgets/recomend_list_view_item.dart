import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/color.dart';

class RecomendedListViewItem extends StatelessWidget {
  const RecomendedListViewItem({super.key});
  final bool checked = false;
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
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                child: Image(
                  image: const AssetImage(Assets.testImage),
                  height: 95.h,
                  width: 105.w,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: kPrimaryColor,
                          size: 21.sp,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          '7.7',
                          style: TextStyle(
                              fontSize: 13.sp, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Text(
                      'Deadpool 2',
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.w500),
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
    );
  }
}
