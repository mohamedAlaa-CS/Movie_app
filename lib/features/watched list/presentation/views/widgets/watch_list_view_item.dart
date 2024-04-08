import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/constants.dart';
import 'package:movie/core/widget/custom_cached_network_image.dart';
import 'package:movie/features/home%20layout/presentation/manager/home_layout_cubit.dart';
import 'package:movie/features/home%20layout/presentation/manager/home_layout_state.dart';
import 'package:movie/models/movie_model.dart';

class WatchListListViewItem extends StatelessWidget {
  const WatchListListViewItem({super.key, required this.model});
  final MovieModel model;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Row(
            children: [
              FittedBox(
                fit: BoxFit.cover,
                child: CustomCachedNetworkImage(
                  imageUrl:
                      '$apiImage${model.backdropPath ?? model.posterPath}',
                  height: 100.h,
                  width: media.width / 3.1,
                ),
              ),
              SizedBox(
                width: media.width / 35,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: media.width / 2,
                    child: Text(
                      model.title ?? '',
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w500),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: media.height / 110),
                  Text(
                    model.releaseDate ?? '',
                    style: TextStyle(fontSize: 12.sp),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: media.height / 150),
                  SizedBox(
                    width: media.width / 2,
                    child: Text(
                      'language: ${model.originalLanguage ?? ''}',
                      style: TextStyle(fontSize: 12.sp),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              )
            ],
          ),
          const Image(image: AssetImage('assets/images/bookmark_add.png')),
          BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
            listener: (context, state) {},
            builder: (context, state) {
              var homeCubit = HomeLayoutCubit.get(context);
              return InkWell(
                onTap: () {
                  HomeLayoutCubit.get(context).changeWatchList(
                    model.id.toString(),
                    model: model,
                  );
                },
                child: Positioned(
                  left: 4.w,
                  top: 3.h,
                  child: Icon(
                    homeCubit.favItemsID.contains(model.id.toString())
                        ? Icons.check
                        : Icons.add,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
