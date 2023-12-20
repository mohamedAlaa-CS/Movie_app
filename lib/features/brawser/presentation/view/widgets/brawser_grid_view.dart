import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/features/brawser/presentation/view/widgets/brawser_gride_view_item.dart';

class BrawserGrideView extends StatelessWidget {
  const BrawserGrideView({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
        crossAxisSpacing: 30.w,
        mainAxisSpacing: 47.h,
      ),
      itemBuilder: (context, index) => const BrawserGrideViewItem(),
    );
  }
}
