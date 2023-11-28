import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/home/presentation/manager/New%20Relase%20cubit/new_relase_cubit.dart';

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
          return const Center(child: CircularProgressIndicator());
        }
        if (state is NewRelaseFailuer) {
          return Center(child: Text(state.errorMessage));
        }
        return SizedBox(
          height: media.height / 6,
          child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                    width: media.width / 32,
                  ),
              scrollDirection: Axis.horizontal,
              itemCount: cubit.newRelaseList.length,
              itemBuilder: (contetxt, index) => NewsRelaseListViewItem(
                    model: cubit.newRelaseList[index],
                    checked: cubit.selectedItemToWatchList.contains(index),
                    onTap: () {
                      cubit.changeWatchList(index);
                    },
                  )),
        );
      },
    );
  }
}
