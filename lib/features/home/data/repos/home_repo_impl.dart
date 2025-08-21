import 'package:dartz/dartz.dart';

import '../../../../core/models/movie.dart';
import '../../../../core/models/tv.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/mapper.dart';
import '../../../../core/utils/service_locator.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<String, List<Movie>>> fetchMovies(String endPoint) async {
    try {
      var data = await getIt.get<ApiService>().get(endPoint: endPoint);
      List<Movie> movies = getIt.get<Mapper>().movieMapper(data);
      return right(movies);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<Tv>>> fetchTv(String endPoint) async {
    try {
      var data = await getIt.get<ApiService>().get(endPoint: endPoint);
      List<Tv> tvs = getIt.get<Mapper>().tvMapper(data);
      return right(tvs);
    } catch (e) {
      return left(e.toString());
    }
  }
}
