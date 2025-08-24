import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/auth/data/repos/auth_repo_impl.dart';
import '../../features/details/data/repos/details_repo.dart';
import '../../features/details/data/repos/details_repo_impl.dart';
import '../../features/home/data/repos/home_repo.dart';
import '../../features/home/data/repos/home_repo_impl.dart';
import '../../features/search/data/repos/search_repo.dart';
import '../../features/search/data/repos/search_repo_impl.dart';
import 'api_service.dart';
import 'database_helper.dart';
import 'mapper.dart';

// import '../../features/home/data/repos/home_repo_impl.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<DatabaseHelper>(DatabaseHelper());
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl());
  getIt.registerSingleton<HomeRepo>(HomeRepoImpl());
  getIt.registerSingleton<DetailsRepo>(DetailsRepoImpl());
  getIt.registerSingleton<SearchRepo>(SearchRepoImpl());
  getIt.registerSingleton<Mapper>(MapperImpl());
  // getIt.registerSingleton<FirebaseService>(
  //   FirebaseService(firestore: getIt.get<FirebaseFirestore>()),
  // );
  // getIt.registerSingleton<HomeRepoImpl>(
  //   HomeRepoImpl(getIt.get<FirebaseService>()),
  // );
}
