import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/color.dart';
import 'package:movie/core/widget/custom_cached_network_image.dart';
import 'package:movie/features/home/data/model/new.model.dart';

import '../../../../../core/utils/constants.dart';

class NewsRelaseListViewItem extends StatelessWidget {
  final bool checked;
  final NewModel model;
  final int index;
  final void Function() onTap;
  const NewsRelaseListViewItem(
      {super.key,
      required this.model,
      required this.checked,
      required this.onTap,
      required this.index});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        children: [
          Hero(
            tag: 'herorelase$index',
            child: CustomCachedNetworkImage(
              height: 130.h,
              width: 90.w,
              imageUrl: '$apiImage${model.posterPath}',
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
    );
  }
}
