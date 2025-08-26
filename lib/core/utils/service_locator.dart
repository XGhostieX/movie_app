import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/datasources/auth_local_datasource.dart';
import '../../features/auth/data/datasources/auth_local_datasource_impl.dart';
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

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<DatabaseHelper>(SQLiteDatabaseHelper());
  getIt.registerSingleton<ApiService>(ApiService(getIt.get<Dio>()));
  getIt.registerSingleton<Mapper>(MapperImpl());
  getIt.registerSingleton<AuthLocalDataSource>(
    AuthLocalDataSourceImpl(getIt.get<DatabaseHelper>()),
  );
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(getIt.get<AuthLocalDataSource>()),
  );
  getIt.registerSingleton<HomeRepo>(
    HomeRepoImpl(getIt.get<ApiService>(), getIt.get<Mapper>()),
  );
  getIt.registerSingleton<DetailsRepo>(
    DetailsRepoImpl(getIt.get<ApiService>(), getIt.get<Mapper>()),
  );
  getIt.registerSingleton<SearchRepo>(
    SearchRepoImpl(getIt.get<ApiService>(), getIt.get<Mapper>()),
  );
}
