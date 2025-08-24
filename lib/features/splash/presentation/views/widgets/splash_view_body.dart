import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      // ignore: use_build_context_synchronously
      GoRouter.of(context).pushReplacement(AppRouter.kAuthView);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.splashBackground),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFF1A1B20).withValues(alpha: 0),
                const Color(0xFF1A1B20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
