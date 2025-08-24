import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/theme/app_theme.dart';
import 'core/utils/app_router.dart';
import 'core/utils/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MaterialApp.router(
      title: 'Moviezone',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      routerConfig: AppRouter.router,
    );
  }
}
