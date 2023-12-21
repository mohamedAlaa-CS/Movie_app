import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/features/watched%20list/presentation/views/widgets/watched_list_view_ui.dart';

class WatchedListView extends StatelessWidget {
  static const String routeName = '/watched_list_view';

  const WatchedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Watchlist',
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 13.h),
            const WatchListViewUi()
          ],
        ),
      ),
    );
  }
}
