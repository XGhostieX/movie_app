import 'package:get_it/get_it.dart';

import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/auth/data/repos/auth_repo_impl.dart';
import '../usecases/is_authenticated_usecase.dart';
import '../usecases/signin_usecase.dart';
import '../usecases/signup_usecase.dart';
import 'auth_api_service.dart';
import 'dio_client.dart';

// import '../../features/home/data/repos/home_repo_impl.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<DioClient>(DioClient());
  getIt.registerSingleton<AuthApiService>(AuthApiService());
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl());
  getIt.registerSingleton<SignupUsecase>(SignupUsecase());
  getIt.registerSingleton<SigninUsecase>(SigninUsecase());
  getIt.registerSingleton<IsAuthenticatedUsecase>(IsAuthenticatedUsecase());
  // getIt.registerSingleton<FirebaseService>(
  //   FirebaseService(firestore: getIt.get<FirebaseFirestore>()),
  // );
  // getIt.registerSingleton<HomeRepoImpl>(
  //   HomeRepoImpl(getIt.get<FirebaseService>()),
  // );
}
