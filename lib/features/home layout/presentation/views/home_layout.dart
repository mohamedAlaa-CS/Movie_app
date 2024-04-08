import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/home%20layout/presentation/manager/home_layout_cubit.dart';
import 'package:movie/features/home%20layout/presentation/manager/home_layout_state.dart';

class HomeLayoutView extends StatelessWidget {
  static const String routeName = '/home_layout';

  const HomeLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = HomeLayoutCubit.get(context);
    return BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.select,
              onTap: (value) {
                cubit.changeIndex(value);
              },
              items: cubit.bottomItems,
            ),
            body: cubit.views[cubit.select],
          ),
        );
      },
    );
  }
}
