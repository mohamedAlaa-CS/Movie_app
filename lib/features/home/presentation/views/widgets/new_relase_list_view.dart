import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/core/widget/custom_loading.dart';
import 'package:movie/features/home%20layout/presentation/manager/home_layout_cubit.dart';
import 'package:movie/features/home%20layout/presentation/manager/home_layout_state.dart';
import 'package:movie/features/home/presentation/manager/New%20Relase%20cubit/new_relase_cubit.dart';
import 'package:movie/features/home/presentation/views/widgets/recomed_list_view.dart';

import '../home_details.dart';
import 'new_relased_list_view_item.dart';

class NewRelaseListView extends StatelessWidget {
  const NewRelaseListView({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var cubit = NewRelaseCubit.get(context);
    return BlocBuilder<NewRelaseCubit, NewRelaseState>(
      builder: (context, state) {
        if (state is NewRelaseLoading) {
          return SizedBox(
              height: media.height / 6, child: const CustomLoading());
        }
        if (state is NewRelaseFailuer) {
          return Center(child: Text(state.errorMessage));
        }
        return SizedBox(
          height: media.height / 6,
          child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              scrollDirection: Axis.horizontal,
              itemCount: cubit.newRelaseList.length,
              itemBuilder: (contetxt, index) => InkWell(
                    onTap: () {
                      GoRouter.of(context).push(HomeDetailsView.routeName,
                          extra: SendDataToDetailsView(
                              cubit.newRelaseList[index].id!, 'relase$index'));
                    },
                    child: BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        var homelayoutCubit = HomeLayoutCubit.get(context);
                        var modelId = cubit.newRelaseList[index].id;
                        return NewsRelaseListViewItem(
                          model: cubit.newRelaseList[index],
                          checked: homelayoutCubit.favItemsID
                              .contains(modelId.toString()),
                          onTap: () {
                            homelayoutCubit.changeWatchList(
                              modelId.toString(),
                              model: cubit.newRelaseList[index],
                            );
                          },
                          index: index,
                        );
                      },
                    ),
                  )),
        );
      },
    );
  }
}
