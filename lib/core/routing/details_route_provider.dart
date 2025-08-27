import 'package:go_router/go_router.dart';

import '../../features/details/presentation/views/movie_details_view.dart';
import '../../features/details/presentation/views/tv_details_view.dart';
import '../models/movie.dart';
import '../models/tv.dart';
import 'route_provider.dart';

class DetailsRouteProvider implements RouteProvider {
  static const kMovieDetailsView = '/movie-details-view';
  static const kTvDetailsView = '/tv-details-view';
  @override
  List<GoRoute> get routes => [
    GoRoute(
      path: kMovieDetailsView,
      name: 'Movie Details',
      builder: (context, state) =>
          MovieDetailsView(movie: state.extra as Movie),
    ),
    GoRoute(
      path: kTvDetailsView,
      name: 'Tv Details',
      builder: (context, state) => TvDetailsView(tv: state.extra as Tv),
    ),
  ];
}
