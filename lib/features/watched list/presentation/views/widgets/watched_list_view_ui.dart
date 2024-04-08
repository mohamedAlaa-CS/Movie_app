import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/features/home%20layout/presentation/manager/home_layout_cubit.dart';
import 'package:movie/features/home%20layout/presentation/manager/home_layout_state.dart';
import 'package:movie/features/watched%20list/presentation/views/widgets/watch_list_view_item.dart';

class WatchListViewUi extends StatelessWidget {
  const WatchListViewUi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeLayoutCubit.get(context);
        return Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              thickness: 2,
              height: 18.h,
              endIndent: 10.w,
              indent: 10.w,
            ),
            itemBuilder: (context, index) =>
                WatchListListViewItem(model: cubit.favRecomendList[index]),
            itemCount: cubit.favRecomendList.length,
          ),
        );
      },
    );
  }
}
