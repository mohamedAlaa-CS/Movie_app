import 'package:go_router/go_router.dart';
import 'package:movie/features/brawser/presentation/view/brawser_category_details.dart';
import 'package:movie/features/brawser/presentation/view/brawser_view.dart';
import 'package:movie/features/home%20layout/presentation/views/home_layout.dart';
import 'package:movie/features/home/presentation/views/home_details.dart';
import 'package:movie/features/home/presentation/views/home_view.dart';
import 'package:movie/features/home/presentation/views/widgets/recomed_list_view.dart';
import 'package:movie/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:movie/features/search/presentation/views/shearch_view.dart';
import 'package:movie/features/splash/presentaion/view/spalsh_view.dart';
import 'package:movie/features/watched%20list/presentation/views/watched_list_view.dart';

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
      GoRoute(
        path: HomeLayoutView.routeName,
        builder: (context, state) => const HomeLayoutView(),
      ),
      GoRoute(
        path: HomeView.routeName,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: SearchView.routeName,
        builder: (context, state) => SearchView(),
      ),
      GoRoute(
        path: BrawserView.routeName,
        builder: (context, state) => const BrawserView(),
      ),
      GoRoute(
        path: WatchedListView.routeName,
        builder: (context, state) => const WatchedListView(),
      ),
      GoRoute(
        path: HomeDetailsView.routeName,
        builder: (context, state) => HomeDetailsView(
            sendDataToDetailsView: state.extra as SendDataToDetailsView),
      ),
      GoRoute(
        path: BrawserCategoryDetails.routeName,
        builder: (context, state) =>
            BrawserCategoryDetails(query: state.extra as String),
      ),
    ],
  );
}
