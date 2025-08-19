import 'package:dartz/dartz.dart';

import '../../../../core/models/movie.dart';
import '../../../../core/models/tv.dart';

// abstract class HomeRepo {
//   Future<Either> fetchTrendingMovies();
//   Future<Either> fetchPopularMovies();
//   Future<Either> fetchPopularTv();
//   Future<Either> fetchTopRatedMovies();
//   Future<Either> fetchTopRatedTv();
//   Future<Either> fetchUpcomingMovies();
// }
abstract class HomeRepo {
  Future<Either<String, List<Movie>>> fetchMovies(String endPoint);
  Future<Either<String, List<Tv>>> fetchTv(String endPoint);
}
