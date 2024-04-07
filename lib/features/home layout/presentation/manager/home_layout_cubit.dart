import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  changeIndex(index) {
    select = index;
    emit(HomeLayoutChangeState());
  }

  List<Widget> views = [
    const HomeView(),
    SearchView(),
    const BrawserView(),
    const WatchedListView()
  ];
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(FontAwesomeIcons.houseChimney), label: 'HOME'),
    const BottomNavigationBarItem(
        icon: Icon(FontAwesomeIcons.magnifyingGlass), label: 'SEARCH'),
    const BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('assets/images/browser_icon.png')),
        label: 'Browse'),
    const BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('assets/images/watch_icon.png')),
        label: 'Watchlist'),
  ];

  Set<String> favItemsID = {};
  Set<dynamic> favRecomendList = {};
  // List<dynamic> favRecomendList = [];

  changeWatchList(String id, {required model}) {
    if (favItemsID.contains(id)) {
      favItemsID.remove(id);
      favRecomendList.remove(model);

      log(favItemsID.toString());
      log(favRecomendList.toString());
      emit(HomeLayoutRemoveToWactchListState());
    } else {
      favItemsID.add(id);
      if (!favRecomendList.contains(model)) {
        favRecomendList.add(model);
      }

      log(favItemsID.toString());
      log(favRecomendList.toString());
      emit(HomeLayoutAddToWactchListState());
    }
  }
}
