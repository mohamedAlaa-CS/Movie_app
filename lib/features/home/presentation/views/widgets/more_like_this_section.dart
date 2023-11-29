import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/features/home/presentation/views/widgets/more_like_list_view.dart';

class MoreLikeThisSection extends StatelessWidget {
  const MoreLikeThisSection({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: media.height / 3.7,
      color: const Color(0xff282A28),
      padding: EdgeInsets.only(left: 10.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('More Like This',
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 5.h,
          ),
          const MoreLikeListView()
        ],
      ),
    );
  }
}
