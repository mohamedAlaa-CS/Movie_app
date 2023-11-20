import 'package:flutter/material.dart';
import 'package:movie/core/utils/theming.dart';

import 'features/splash/presentaion/view/spalsh_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: appTheme,
      home: const SplashView(),
    );
  }
}
