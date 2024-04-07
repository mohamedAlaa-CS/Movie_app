import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/core/utils/api_service.dart';
import 'package:movie/core/widget/custom_loading.dart';
import 'package:movie/features/home%20layout/presentation/manager/home_layout_cubit.dart';
import 'package:movie/features/home%20layout/presentation/manager/home_layout_state.dart';
import 'package:movie/features/home/data/repos/home%20details%20repo/home_details_repo_impl.dart';
import 'package:movie/features/home/presentation/manager/similar%20cubit/similar_cubit.dart';
import 'package:movie/features/home/presentation/views/widgets/more_like_list_view_item.dart';
import 'package:movie/features/home/presentation/views/widgets/recomed_list_view.dart';

import '../home_details.dart';

class MoreLikeListView extends StatelessWidget {
  const MoreLikeListView({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => SimilarCubit(HomeDetailsRepoImpl(ApiService(Dio())))
        ..featchSimailar(id: id),
      child: BlocBuilder<SimilarCubit, SimilarState>(
        builder: (context, state) {
          var cubit = SimilarCubit.get(context);
          if (state is SimilarLoading) {
            return SizedBox(
              height: 140.h,
              child: const CustomLoading(),
            );
          }
          if (state is SimilarFailuer) {
            return Center(child: Text(state.errorMessage));
          }
          return SizedBox(
            height: 140.h,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      GoRouter.of(context).push(
                        HomeDetailsView.routeName,
                        extra: SendDataToDetailsView(
                            cubit.similarMovieList[index].id!, 'similar$index'),
                      );
                    },
                    child: BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        var homeLayoutCubit = HomeLayoutCubit.get(context);
                        var modelId = cubit.similarMovieList[index].id;

                        return MoreLikeListViewItem(
                          model: cubit.similarMovieList[index],
                          checked: homeLayoutCubit.favItemsID
                              .contains(modelId.toString()),
                          ontap: () {
                            homeLayoutCubit.changeWatchList(
                              modelId.toString(),
                              model: cubit.similarMovieList[index],
                            );
                          },
                          index: index,
                        );
                      },
                    )),
                separatorBuilder: (context, index) =>
                    SizedBox(width: media.width / 22),
                itemCount: cubit.similarMovieList.length),
          );
        },
      ),
    );
  }
}
