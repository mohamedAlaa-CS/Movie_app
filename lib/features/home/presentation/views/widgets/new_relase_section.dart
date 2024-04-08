import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'new_relase_list_view.dart';

class NewRelaseSection extends StatelessWidget {
  const NewRelaseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff282A28),
      padding:
          EdgeInsets.only(left: 10.w, top: 10.h, right: 10.w, bottom: 13.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'News Relases',
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const NewRelaseListView(),
        ],
      ),
    );
  }
}
