import 'package:go_router/go_router.dart';

import '../../features/search/presentation/views/search_view.dart';
import 'route_provider.dart';

class SearchRouteProvider implements RouteProvider {
  static const kSearchView = '/search-view';
  @override
  List<GoRoute> get routes => [
    GoRoute(
      path: kSearchView,
      name: 'Search',
      builder: (context, state) => const SearchView(),
    ),
  ];
}
