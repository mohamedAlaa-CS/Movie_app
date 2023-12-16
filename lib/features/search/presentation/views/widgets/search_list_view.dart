import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/features/search/presentation/manager/search%20cubit/search_cubit.dart';
import 'package:movie/features/search/presentation/views/widgets/search_list_view_item.dart';

import '../../manager/search cubit/search_state.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(listener: (context, state) {
      if (state is SearchLoading) {
        const Center(child: CircularProgressIndicator());
      }
      if (state is SearchFailuer) {
        Center(child: Text(state.errorMessage));
      }
    }, builder: (context, state) {
      var cubit = SearchCubit.get(context);

      return cubit.searchData.isNotEmpty
          ? Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  thickness: 2,
                  height: 18.h,
                  endIndent: 10.w,
                  indent: 10.w,
                ),
                itemBuilder: (context, index) =>
                    SearchListViewItem(model: cubit.searchData[index]),
                itemCount: cubit.searchData.length,
              ),
            )
          : Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image:
                        const AssetImage('assets/images/not_search_image.png'),
                    fit: BoxFit.cover,
                    height: 87.h,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'No movies found',
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            );
    });
  }
}
