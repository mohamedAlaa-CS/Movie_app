import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/features/brawser/presentation/manager/brawser%20cubit/brawser_cubit.dart';
import 'package:movie/features/brawser/presentation/manager/brawser%20cubit/brawser_state.dart';
import 'package:movie/features/brawser/presentation/view/brawser_category_details.dart';
import 'package:movie/features/brawser/presentation/view/widgets/brawser_gride_view_item.dart';

class BrawserGrideView extends StatelessWidget {
  const BrawserGrideView({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return BlocConsumer<BrawserCubit, BrawserState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BrawserCubit.get(context);
        return GridView.builder(
          itemCount: cubit.categoryNames.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
            crossAxisSpacing: 30.w,
            mainAxisSpacing: 47.h,
          ),
          itemBuilder: (context, index) => InkWell(
              onTap: () {
                GoRouter.of(context).push(BrawserCategoryDetails.routeName,
                    extra: cubit.categoryNames[index].name);
              },
              child: BrawserGrideViewItem(
                  name: cubit.categoryNames[index].name ?? '')),
        );
      },
    );
  }
}
