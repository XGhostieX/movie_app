import 'package:dartz/dartz.dart';

import '../../../../core/models/movie.dart';
import '../../../../core/models/tv.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/mapper.dart';
import 'search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;
  final Mapper mapper;

  SearchRepoImpl(this.apiService, this.mapper);
  @override
  Future<Either> fetchMovies(String qurey) async {
    try {
      var data = await apiService.search(endPoint: 'search/movie?query=$qurey');
      List<Movie> movies = mapper.movieMapper(data);
      return right(movies);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  @override
  Future<Either> fetchTv(String qurey) async {
    try {
      var data = await apiService.search(endPoint: 'search/tv?query=$qurey');
      List<Tv> tvs = mapper.tvMapper(data);
      return right(tvs);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
