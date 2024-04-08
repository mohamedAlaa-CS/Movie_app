import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/core/widget/custom_loading.dart';
import 'package:movie/features/home%20layout/presentation/manager/home_layout_cubit.dart';
import 'package:movie/features/home%20layout/presentation/manager/home_layout_state.dart';
import 'package:movie/features/home/presentation/manager/Recomend%20cubit/recomend_cubit.dart';
import 'package:movie/features/home/presentation/views/home_details.dart';
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
          return SizedBox(height: 140.h, child: const CustomLoading());
        }
        if (state is RecomendFailure) {
          return Center(child: Text(state.errorMessage));
        }

        return SizedBox(
          height: media.height / 4.4,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      GoRouter.of(context).push(HomeDetailsView.routeName,
                          extra: SendDataToDetailsView(
                              cubit.recomendMovieList[index].id!,
                              'recomend$index'));
                    },
                    child: BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        var homeLayoutCubit = HomeLayoutCubit.get(context);
                        var modelId = cubit.recomendMovieList[index].id;
                        return RecomendedListViewItem(
                          index: index,
                          model: cubit.recomendMovieList[index],
                          checked: homeLayoutCubit.favItemsID
                              .contains(modelId.toString()),
                          onTap: () {
                            homeLayoutCubit.changeWatchList(
                              modelId.toString(),
                              model: cubit.recomendMovieList[index],
                            );
                          },
                        );
                      },
                    ),
                  ),
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: cubit.recomendMovieList.length),
        );
      },
    );
  }
}

class SendDataToDetailsView {
  final int id;
  final String hero;

  SendDataToDetailsView(
    this.id,
    this.hero,
  );
}
