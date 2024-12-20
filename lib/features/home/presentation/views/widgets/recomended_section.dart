import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/features/home/presentation/views/widgets/recomed_list_view.dart';

class RecomendedSection extends StatelessWidget {
  const RecomendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xff282A28),
      padding:
          EdgeInsets.only(left: 10.w, top: 10.h, right: 10.w, bottom: 13.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recomend',
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 5.h,
          ),
          const RecomendListView()
        ],
      ),
    );
  }
}
