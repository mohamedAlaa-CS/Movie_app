import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/features/brawser/presentation/view/widgets/brawser_grid_view.dart';

class BrawserView extends StatelessWidget {
  static const String routeName = '/brawser_view';
  const BrawserView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Browse Category ',
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 13.h),
            const Expanded(child: BrawserGrideView()),
          ],
        ),
      ),
    );
  }
}
