import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/core/utils/assets.dart';
import 'package:movie/features/onboarding/onboarding_view.dart';

class SplashView extends StatefulWidget {
  static const String routeName = '/';
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      GoRouter.of(context).push('/onBoarding');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage(
            Assets.logo,
          ),
        ),
      ),
    );
  }
}
