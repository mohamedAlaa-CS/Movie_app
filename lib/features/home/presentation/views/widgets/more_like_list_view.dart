import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/features/home/presentation/views/widgets/more_like_list_view_item.dart';

import '../home_details.dart';

class MoreLikeListView extends StatelessWidget {
  const MoreLikeListView({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SizedBox(
      height: 140.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => InkWell(
              onTap: () {
                GoRouter.of(context).push(HomeDetailsView.routeName);
              },
              child: const MoreLikeListViewItem()),
          separatorBuilder: (context, index) =>
              SizedBox(width: media.width / 22),
          itemCount: 10),
    );
  }
}
