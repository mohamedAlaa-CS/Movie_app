import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'new_relase_list_view.dart';

class NewRelaseSection extends StatelessWidget {
  const NewRelaseSection({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      color: const Color(0xff282A28),
      height: media.height / 4.5,
      child: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'News Relases',
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: media.height / 100),
            const NewRelaseListView(),
          ],
        ),
      ),
    );
  }
}
