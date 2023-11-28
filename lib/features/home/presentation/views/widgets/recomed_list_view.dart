import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/features/home/presentation/manager/Recomend%20cubit/recomend_cubit.dart';
import 'package:movie/features/home/presentation/views/widgets/recomend_list_view_item.dart';

class RecomendListView extends StatelessWidget {
  const RecomendListView({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var cubit = RecomendCubit.get(context);
    return BlocBuilder<RecomendCubit, RecomendState>(
      builder: (context, state) {
        if (state is RecomendLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is RecomendFailure) {
          return Center(child: Text(state.errorMessage));
        }

        return SizedBox(
          height: 140.h,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => RecomendedListViewItem(
                    model: cubit.recomendMovieList[index],
                    checked: cubit.selectItemToWatchListView.contains(index),
                    onTap: () {
                      cubit.changeWatchList(index);
                    },
                  ),
              separatorBuilder: (context, index) =>
                  SizedBox(width: media.width / 22),
              itemCount: cubit.recomendMovieList.length),
        );
      },
    );
  }
}
