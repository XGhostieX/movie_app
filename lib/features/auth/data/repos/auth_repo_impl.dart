import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/models/auth.dart';
import '../../../../core/utils/auth_api_service.dart';
import '../../../../core/utils/service_locator.dart';
import 'auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either> signin(Auth auth) async {
    var data = await getIt<AuthApiService>().signin(auth);
    return data.fold((error) => Left(error), (data) async {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('token', data['user']['token']);
      return Right(data);
    });
  }

  @override
  Future<Either> signup(Auth auth) async {
    var data = await getIt<AuthApiService>().signup(auth);
    return data.fold((error) => Left(error), (data) async {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('token', data['user']['token']);
      return Right(data);
    });
  }

  @override
  Future<bool> isAuthenticated() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    if (token == null) {
      return false;
    } else {
      return true;
    }
  }
}
