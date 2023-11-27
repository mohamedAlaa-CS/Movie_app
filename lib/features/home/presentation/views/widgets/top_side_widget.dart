import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/features/home/presentation/views/widgets/top_side_item.dart';

import '../../manager/Top side cubit/popular_movie_cubit.dart';

class TopSideWidget extends StatelessWidget {
  const TopSideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMovieCubit, PopularMovieState>(
      builder: (context, state) {
        if (state is PopularMovieLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PopularMovieFailuer) {
          return const Center(child: Text('something is wrong'));
        } else if (state is PopularMovieSuccess) {
          return CarouselSlider.builder(
            itemBuilder: (context, index, realIndex) =>
                TopSideItem(model: state.popular[index]),
            itemCount: state.popular.length,
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
        }
        return const Center(child: Text('something is wrong'));
      },
    );
  }
}
