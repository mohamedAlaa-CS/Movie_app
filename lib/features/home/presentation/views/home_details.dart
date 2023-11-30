import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/assets.dart';
import 'package:movie/features/home/presentation/views/widgets/custom_movie_rate.dart';
import 'package:movie/features/home/presentation/views/widgets/more_like_this_section.dart';

import '../../../../core/utils/color.dart';

class HomeDetailsView extends StatelessWidget {
  static const String routeName = '/home_details_view';
  HomeDetailsView({super.key});
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('Dora and the lost city of gold')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: const AssetImage(Assets.testImage),
            height: 190.h,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: media.height / 100.h),
          const Text('Dora and the lost city of gold'),
          SizedBox(height: media.height / 200.h),
          const Text('2019  PG-13  2h 7m'),
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
                      CachedNetworkImage(
                        height: 140.h,
                        width: 100.w,
                        imageUrl:
                            'https://img.freepik.com/free-photo/purple-osteospermum-daisy-flower_1373-16.jpg',
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Center(child: Icon(Icons.error)),
                      ),
                      Image(
                        image:
                            const AssetImage('assets/images/bookmark_add.png'),
                        color:
                            checked ? kPrimaryColor : const Color(0xff514F4F),
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
                        child: const Center(child: Text('box')),
                      ),
                      SizedBox(height: 10.h),
                      SizedBox(
                        width: media.width / 1.57,
                        child: const Text(
                          'Having spent most of her life exploring the jungle, nothing could prepare Dora for her most dangerous adventure yet — high school. ',
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: 3.h),
                      const CustomMovieRate(rate: '7.7')
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
  }
}
