import 'package:go_router/go_router.dart';
import 'package:movie/features/onboarding/onboarding_view.dart';
import 'package:movie/features/splash/presentaion/view/spalsh_view.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: SplashView.routeName,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: OnBoardingView.routeName,
        builder: (context, state) => const OnBoardingView(),
      ),
    ],
  );
}
