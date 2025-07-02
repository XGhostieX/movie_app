import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashDisplay());

  void checkAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    emit(Unauthenticated());
  }
}
