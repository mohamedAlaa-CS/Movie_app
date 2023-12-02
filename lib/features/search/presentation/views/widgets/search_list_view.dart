import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/features/search/presentation/views/widgets/search_list_view_item.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          thickness: 2,
          height: 18.h,
          endIndent: 10.w,
          indent: 10.w,
        ),
        itemBuilder: (context, index) => const SearchListViewItem(),
        itemCount: 100,
      ),
    );
  }
}
