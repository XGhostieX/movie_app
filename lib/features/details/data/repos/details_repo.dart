import 'package:dartz/dartz.dart';

abstract class DetailsRepo {
  Future<Either> fetchMovieTrailer(int id);
  Future<Either> fetchTvTrailer(int id);
  Future<Either> fetchMovieGenres(int id);
  Future<Either> fetchTvGenres(int id);
  Future<Either> fetchMovieCast(int id);
  Future<Either> fetchTvCast(int id);
  Future<Either> fetchMovieReviews(int id);
  Future<Either> fetchTvReviews(int id);
  Future<Either> fetchRecommendationsMovies(int id);
  Future<Either> fetchRecommendationsTv(int id);
  Future<Either> fetchSimilarMovies(int id);
  Future<Either> fetchSimilarTv(int id);
}
