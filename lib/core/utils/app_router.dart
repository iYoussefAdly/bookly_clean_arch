import 'package:bookly_clean_arch/features/home/presentation/views/details_view.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/home_view.dart';
import 'package:bookly_clean_arch/features/search/presentation/views/search_view.dart';
import 'package:bookly_clean_arch/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kDetailsView = "/DetailsView";
  static const kHomeView = "/HomeView";
  static const kSearchView = "/SearchView";
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) {
          return SplashView();
        },
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) {
          return HomeView();
        },
      ),
      GoRoute(
        path: kDetailsView,
        builder: (context, state) {
          return DetailsView();
        },
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) {
          return SearchView();
        },
      ),
    ],
  );
}
