import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/brawser/presentation/view/brawser_view.dart';
import 'package:movie/features/home%20layout/presentation/manager/home_layout_state.dart';
import 'package:movie/features/home/presentation/views/home_view.dart';
import 'package:movie/features/search/presentation/views/shearch_view.dart';
import 'package:movie/features/watched%20list/presentation/views/watched_list_view.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeLayoutIntialState());

  static HomeLayoutCubit get(context) =>
      BlocProvider.of<HomeLayoutCubit>(context);
  int select = 0;
  List<Widget> views = [
    const HomeView(),
    SearchView(),
    const BrawserView(),
    const WatchedListView()
  ];
}
