import 'package:go_router/go_router.dart';

import '../../features/splash/presentation/views/splash_view.dart';
import 'route_provider.dart';

class SplashRouteProvider implements RouteProvider {
  @override
  List<GoRoute> get routes => [
    GoRoute(
      path: '/',
      name: 'Splash',
      builder: (context, state) => const SplashView(),
    ),
  ];
}
