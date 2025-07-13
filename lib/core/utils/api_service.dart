import 'package:dio/dio.dart';

import 'service_locator.dart';

class ApiService {
  final _key = 'api_key=f19c6766df0f9cc123ff6c6a54ce27cf';
  final _baseUrl = 'https://api.themoviedb.org/3/';

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var respone = await getIt.get<Dio>().get('$_baseUrl$endPoint?$_key');
    return respone.data;
  }

  Future<Map<String, dynamic>> search({required String endPoint}) async {
    var respone = await getIt.get<Dio>().get('$_baseUrl$endPoint&$_key');
    return respone.data;
  }
}
