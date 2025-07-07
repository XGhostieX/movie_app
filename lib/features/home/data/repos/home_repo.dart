import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either> fetchTrendingMovies();
  Future<Either> fetchPopularMovies();
  Future<Either> fetchPopularTv();
  Future<Either> fetchTopRatedMovies();
  Future<Either> fetchTopRatedTv();
  Future<Either> fetchUpcomingMovies();
}
