import 'package:go_router/go_router.dart';

import 'route_provider.dart';

class RouteRegistry {
  final List<RouteProvider> _providers = [];

  void registerProvider(RouteProvider provider) {
    _providers.add(provider);
  }

  void registerProviders(List<RouteProvider> providers) {
    _providers.addAll(providers);
  }

  List<GoRoute> getAllRoutes() {
    return _providers.expand((provider) => provider.routes).toList();
  }
}
