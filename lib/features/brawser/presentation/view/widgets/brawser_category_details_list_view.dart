import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/features/brawser/presentation/view/widgets/brawser_category_details_item.dart';
import 'package:movie/features/search/presentation/manager/search%20cubit/search_cubit.dart';
import 'package:movie/features/search/presentation/manager/search%20cubit/search_state.dart';

class BrawserCategoryDetailsListView extends StatelessWidget {
  const BrawserCategoryDetailsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SearchCubit.get(context);
        return ListView.separated(
          separatorBuilder: (context, index) => Divider(
            thickness: 2,
            height: 18.h,
            endIndent: 10.w,
            indent: 10.w,
          ),
          itemBuilder: (context, index) =>
              BrawserCategoryDetailsItem(model: cubit.searchData[index]),
          itemCount: cubit.searchData.length,
        );
      },
    );
  }
}
