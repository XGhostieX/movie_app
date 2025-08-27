import 'package:dartz/dartz.dart';

import '../../../../core/models/movie.dart';
import '../../../../core/models/tv.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/mapper.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  final Mapper mapper;

  HomeRepoImpl(this.apiService, this.mapper);
  @override
  Future<Either<String, List<Movie>>> fetchMovies(String endPoint) async {
    try {
      var data = await apiService.get(endPoint: endPoint);
      List<Movie> movies = mapper.movieMapper(data);
      return right(movies);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<Tv>>> fetchTv(String endPoint) async {
    try {
      var data = await apiService.get(endPoint: endPoint);
      List<Tv> tvs = mapper.tvMapper(data);
      return right(tvs);
    } catch (e) {
      return left(e.toString());
    }
  }
}
