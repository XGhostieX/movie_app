import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  final _key = 'api_key=f19c6766df0f9cc123ff6c6a54ce27cf';
  final _baseUrl = 'https://api.themoviedb.org/3/';

  ApiService(this.dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var respone = await dio.get('$_baseUrl$endPoint?$_key');
    return respone.data;
  }

  Future<Map<String, dynamic>> search({required String endPoint}) async {
    var respone = await dio.get('$_baseUrl$endPoint&$_key');
    return respone.data;
  }
}
