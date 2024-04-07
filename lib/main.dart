import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/router/app_router.dart';
import 'package:movie/core/utils/api_service.dart';
import 'package:movie/features/home%20layout/presentation/manager/home_layout_cubit.dart';
import 'package:movie/features/home/data/repos/home%20repo/home_repo_impl.dart';
import 'package:movie/features/home/presentation/manager/New%20Relase%20cubit/new_relase_cubit.dart';
import 'package:movie/features/home/presentation/manager/Recomend%20cubit/recomend_cubit.dart';
import 'package:movie/features/search/presentation/manager/search%20cubit/search_cubit.dart';

import 'core/utils/theming.dart';
import 'features/home/presentation/manager/Top side cubit/popular_movie_cubit.dart';
import 'features/search/data/repos/search_repo_impel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeLayoutCubit>(
          create: (context) => HomeLayoutCubit(),
        ),
        BlocProvider(
          create: (context) =>
              PopularMovieCubit(HomeRepoImpl(ApiService(Dio())))
                ..fetchPopularMovie(),
        ),
        BlocProvider(
          create: (context) => RecomendCubit(HomeRepoImpl(ApiService(Dio())))
            ..featchRecomendMovie(),
        ),
        BlocProvider(
          create: (context) => NewRelaseCubit(HomeRepoImpl(ApiService(Dio())))
            ..featchNewRelase(),
        ),
        BlocProvider(
          create: (context) => SearchCubit(SearchRepoImple(ApiService(Dio()))),
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            title: 'Movie App',
            darkTheme: appTheme,
            themeMode: ThemeMode.dark,
          );
        },
      ),
    );
  }
}
