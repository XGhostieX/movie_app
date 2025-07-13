import 'package:dartz/dartz.dart';

import '../../../../core/models/movie.dart';
import '../../../../core/models/tv.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/service_locator.dart';
import 'search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  @override
  Future<Either> fetchSearchMovies(String qurey) async {
    try {
      var data = await getIt.get<ApiService>().search(
        endPoint: 'search/movie?query=$qurey',
      );
      List<Movie> movies = [];
      for (var element in data['results']) {
        movies.add(Movie.fromMap(element));
      }
      return right(movies);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  @override
  Future<Either> fetchSearchTv(String qurey) async {
    try {
      var data = await getIt.get<ApiService>().search(
        endPoint: 'search/tv?query=$qurey',
      );
      List<Tv> tvs = [];
      for (var element in data['results']) {
        tvs.add(Tv.fromMap(element));
      }
      return right(tvs);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
