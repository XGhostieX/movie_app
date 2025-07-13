import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/usecases/is_authenticated_usecase.dart';
import '../../../../../core/utils/service_locator.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashDisplay());

  void checkAuth() async {
    // await Future.delayed(const Duration(seconds: 2));
    var isAuthenticated = await getIt<IsAuthenticatedUsecase>().call();
    if (isAuthenticated) {
      emit(Authenticated());
    } else {
      emit(Unauthenticated());
    }
  }
}
