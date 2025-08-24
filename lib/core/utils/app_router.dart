import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/views/auth_view.dart';
import '../../features/auth/presentation/views/widgets/sign_in.dart';
import '../../features/auth/presentation/views/widgets/sign_up.dart';
import '../../features/details/presentation/views/movie_details_view.dart';
import '../../features/details/presentation/views/tv_details_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/search/presentation/views/search_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../models/movie.dart';
import '../models/tv.dart';

abstract class AppRouter {
  static const kAuthView = '/auth-view';
  static const kSignIn = '/sign-in';
  static const kSignUp = '/sign-up';
  static const kHomeView = '/home-view';
  static const kMovieDetailsView = '/movie-details-view';
  static const kTvDetailsView = '/tv-details-view';
  static const kSearchView = '/search-view';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: kAuthView, builder: (context, state) => const AuthView()),
      GoRoute(path: kSignIn, builder: (context, state) => const SignIn()),
      GoRoute(path: kSignUp, builder: (context, state) => const SignUp()),
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: kMovieDetailsView,
        builder: (context, state) =>
            MovieDetailsView(movie: state.extra as Movie),
      ),
      GoRoute(
        path: kTvDetailsView,
        builder: (context, state) => TvDetailsView(tv: state.extra as Tv),
      ),
    ],
  );
}
