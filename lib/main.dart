import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/router/app_router.dart';
import 'package:movie/core/utils/api_service.dart';
import 'package:movie/core/utils/theming.dart';
import 'package:movie/features/home/data/repo/home_repo_impl.dart';
import 'package:movie/features/home/presentation/manager/Recomend%20cubit/recomend_cubit.dart';

import 'features/home/presentation/manager/Top side cubit/popular_movie_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              PopularMovieCubit(HomeRepoImpl(ApiService(Dio())))
                ..fetchPopularMovie(),
        ),
        BlocProvider(
          create: (context) => RecomendCubit(HomeRepoImpl(ApiService(Dio())))
            ..featchRecomendMovie(),
        ),
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
            theme: appTheme,
          );
        },
      ),
    );
  }
}
