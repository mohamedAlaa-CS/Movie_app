import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/api_service.dart';
import 'package:movie/core/utils/constants.dart';
import 'package:movie/features/home/data/repos/home%20details%20repo/home_details_repo_impl.dart';
import 'package:movie/features/home/presentation/manager/Details%20cubit/details_cubit.dart';
import 'package:movie/features/home/presentation/views/widgets/custom_movie_rate.dart';
import 'package:movie/features/home/presentation/views/widgets/more_like_this_section.dart';
import 'package:movie/features/home/presentation/views/widgets/recomed_list_view.dart';

import '../../../../core/utils/color.dart';

class HomeDetailsView extends StatelessWidget {
  static const String routeName = '/home_details_view';
  const HomeDetailsView({super.key, required this.sendDataToDetailsView});
  final SendDataToDetailsView sendDataToDetailsView;
  final bool checked = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return BlocProvider(
        create: (context) =>
            DetailsCubit(HomeDetailsRepoImpl(ApiService(Dio())))
              ..featchDetails(sendDataToDetailsView.id),
        child: BlocBuilder<DetailsCubit, DetailsState>(
          builder: (context, state) {
            if (state is DetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is DetailsFailuer) {
              return Center(child: Text(state.errorMessage));
            }
            var cubit = DetailsCubit.get(context);
            return Scaffold(
              appBar: AppBar(title: Text(cubit.detailsModel.title ?? '')),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl: '$apiImage${cubit.detailsModel.backdropPath}',
                    height: 190.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Center(child: Icon(Icons.error)),
                  ),
                  SizedBox(height: media.height / 100.h),
                  Text(cubit.detailsModel.title ?? ''),
                  SizedBox(height: media.height / 200.h),
                  Text(cubit.detailsModel.releaseDate ?? ''),
                  SizedBox(height: media.height / 30.h),
                  SizedBox(
                    // decoration: const BoxDecoration(color: Colors.red),
                    height: media.height / 5,
                    width: double.infinity,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Stack(
                            children: [
                              Hero(
                                tag: 'hero${sendDataToDetailsView.index}',
                                child: CachedNetworkImage(
                                  height: 140.h,
                                  width: 100.w,
                                  imageUrl:
                                      '$apiImage${cubit.detailsModel.posterPath ?? ''}',
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.high,
                                  placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      const Center(child: Icon(Icons.error)),
                                ),
                              ),
                              Image(
                                image: const AssetImage(
                                    'assets/images/bookmark_add.png'),
                                color: checked
                                    ? kPrimaryColor
                                    : const Color(0xff514F4F),
                              ),
                              Icon(
                                checked ? Icons.check : Icons.add,
                                color: Colors.white,
                                size: 22.sp,
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: media.width / 60),
                        Padding(
                          padding: EdgeInsets.only(left: 5.w, bottom: 5.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 3.h),
                              Container(
                                width: 65.w,
                                height: 22.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    border: Border.all(color: kbookMarkColor)),
                                child: Center(
                                    child: Text(
                                        cubit.detailsModel.genres?[0].name ??
                                            '')),
                              ),
                              SizedBox(height: 10.h),
                              SizedBox(
                                width: media.width / 1.57,
                                child: Text(
                                  cubit.detailsModel.overview ?? '',
                                  maxLines: 6,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(height: 3.h),
                              CustomMovieRate(
                                  rate:
                                      '${cubit.detailsModel.voteAverage ?? ''}')
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  const MoreLikeThisSection(),
                  // const RecomendedSection()
                ],
              ),
            );
          },
        ));
  }
}
