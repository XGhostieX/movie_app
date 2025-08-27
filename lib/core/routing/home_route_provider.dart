import 'package:go_router/go_router.dart';

import '../../features/home/presentation/views/home_view.dart';
import 'route_provider.dart';

class HomeRouteProvider implements RouteProvider {
  static const kHomeView = '/home-view';
  @override
  List<GoRoute> get routes => [
    GoRoute(
      path: kHomeView,
      name: 'Home',
      builder: (context, state) => const HomeView(),
    ),
  ];
}
