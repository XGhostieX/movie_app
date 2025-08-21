import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets.dart';
import '../../views_model/splash_cubit/splash_cubit.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          GoRouter.of(context).pushReplacement(AppRouter.kAuthView);
        } else if (state is Authenticated) {
          GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
        }
      },
      child: Stack(
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
      ),
    );
  }
}
