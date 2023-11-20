import 'package:flutter/material.dart';
import 'package:movie/core/router/app_router.dart';
import 'package:movie/core/utils/theming.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: appTheme,
    );
  }
}
