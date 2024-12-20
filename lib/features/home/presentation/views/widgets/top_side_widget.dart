import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/features/home%20layout/presentation/manager/home_layout_cubit.dart';
import 'package:movie/features/home%20layout/presentation/manager/home_layout_state.dart';
import 'package:movie/features/home/presentation/views/widgets/recomed_list_view.dart';
import 'package:movie/features/home/presentation/views/widgets/top_side_item.dart';
import 'package:movie/features/home/presentation/views/widgets/top_side_widget_loading.dart';

import '../../manager/Top side cubit/popular_movie_cubit.dart';
import '../home_details.dart';

class TopSideWidget extends StatelessWidget {
  const TopSideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = PopularMovieCubit.get(context);
    return BlocBuilder<PopularMovieCubit, PopularMovieState>(
      builder: (context, state) {
        if (state is PopularMovieLoading) {
          return const TopSideWidgetLoading();
        } else if (state is PopularMovieFailuer) {
          return Center(child: Text(state.errorMessage));
        }
        return CarouselSlider.builder(
          itemBuilder: (context, index, realIndex) => InkWell(
            onTap: () {
              GoRouter.of(context).push(HomeDetailsView.routeName,
                  extra: SendDataToDetailsView(
                      cubit.popularMovieList[index].id!, 'top$index'));
            },
            child: BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
              listener: (context, state) {},
              builder: (context, state) {
                var homeLayoutCubit = HomeLayoutCubit.get(context);
                var itemID = cubit.popularMovieList[index].id;
                return TopSideItem(
                  model: cubit.popularMovieList[index],
                  checked:
                      homeLayoutCubit.favItemsID.contains(itemID.toString()),
                  onTap: () {
                    homeLayoutCubit.changeWatchList(
                      itemID.toString(),
                      model: cubit.popularMovieList[index],
                    );
                  },
                  index: index,
                );
              },
            ),
          ),
          itemCount: cubit.popularMovieList.length,
          options: CarouselOptions(
            height: 194.0.h,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16.w / 9.h,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.88,
          ),
        );
      },
    );
  }
}
