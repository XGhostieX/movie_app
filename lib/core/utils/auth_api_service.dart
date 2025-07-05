import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../models/auth.dart';
import 'api_url.dart';
import 'dio_client.dart';
import 'service_locator.dart';

class AuthApiService {
  Future<Either> signin(Auth auth) async {
    try {
      var response = await getIt<DioClient>().post(
        ApiUrl.signin,
        data: auth.toMap(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  Future<Either> signup(Auth auth) async {
    try {
      var response = await getIt<DioClient>().post(
        ApiUrl.signup,
        data: auth.toMap(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
