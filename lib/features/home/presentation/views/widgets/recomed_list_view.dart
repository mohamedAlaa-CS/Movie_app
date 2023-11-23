import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/features/home/presentation/views/widgets/recomend_list_view_item.dart';

class RecomendListView extends StatelessWidget {
  const RecomendListView({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SizedBox(
      height: 140.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => const RecomendedListViewItem(),
          separatorBuilder: (context, index) =>
              SizedBox(width: media.width / 22),
          itemCount: 10),
    );
  }
}
