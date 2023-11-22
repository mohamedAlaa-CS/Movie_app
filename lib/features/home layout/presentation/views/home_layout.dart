import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie/features/home%20layout/presentation/manager/home_layout_cubit.dart';
import 'package:movie/features/home%20layout/presentation/manager/home_layout_state.dart';

class HomeLayoutView extends StatefulWidget {
  static const String routeName = '/home_layout';

  const HomeLayoutView({super.key});

  @override
  State<HomeLayoutView> createState() => _HomeLayoutViewState();
}

class _HomeLayoutViewState extends State<HomeLayoutView> {
  @override
  Widget build(BuildContext context) {
    var cubit = HomeLayoutCubit.get(context);
    return BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.select,
            onTap: (value) {
              setState(() {
                cubit.select = value;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.houseChimney), label: 'HOME'),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.magnifyingGlass),
                  label: 'SEARCH'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/browser_icon.png')),
                  label: 'Browse'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/watch_icon.png')),
                  label: 'Watchlist'),
            ],
          ),
          body: cubit.views[cubit.select],
        );
      },
    );
  }
}
