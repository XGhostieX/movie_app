import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/views/auth_view.dart';
import '../../features/auth/presentation/views/widgets/sign_in.dart';
import '../../features/auth/presentation/views/widgets/sign_up.dart';
import 'route_provider.dart';

class AuthRouteProvider implements RouteProvider {
  static const kAuthView = '/auth-view';
  static const kSignIn = '/sign-in';
  static const kSignUp = '/sign-up';
  @override
  List<GoRoute> get routes => [
    GoRoute(
      path: kAuthView,
      name: 'Auth',
      builder: (context, state) => const AuthView(),
    ),
    GoRoute(
      path: kSignIn,
      name: 'Sign In',
      builder: (context, state) => const SignIn(),
    ),
    GoRoute(
      path: kSignUp,
      name: 'Sign Up',
      builder: (context, state) => const SignUp(),
    ),
  ];
}
