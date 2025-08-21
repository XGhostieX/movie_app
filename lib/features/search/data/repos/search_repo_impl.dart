import 'package:dartz/dartz.dart';

import '../../../../core/models/movie.dart';
import '../../../../core/models/tv.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/mapper.dart';
import '../../../../core/utils/service_locator.dart';
import 'search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  @override
  Future<Either> fetchMovies(String qurey) async {
    try {
      var data = await getIt.get<ApiService>().search(
        endPoint: 'search/movie?query=$qurey',
      );
      List<Movie> movies = getIt.get<Mapper>().movieMapper(data);
      return right(movies);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  @override
  Future<Either> fetchTv(String qurey) async {
    try {
      var data = await getIt.get<ApiService>().search(
        endPoint: 'search/tv?query=$qurey',
      );
      List<Tv> tvs = getIt.get<Mapper>().tvMapper(data);
      return right(tvs);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
