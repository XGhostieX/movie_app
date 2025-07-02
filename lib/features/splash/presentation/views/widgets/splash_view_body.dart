import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/app_navigator.dart';
import 'package:movie_app/features/home/presentation/views/home_view.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../auth/presentation/views/auth_view.dart' show AuthView;
import '../../views_model/splash_cubit/splash_cubit.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          AppNavigator.pushReplacement(context, const AuthView());
        } else if (state is Authenticated) {
          AppNavigator.pushReplacement(context, const HomeView());
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
