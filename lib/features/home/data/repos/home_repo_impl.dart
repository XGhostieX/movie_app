import 'package:dartz/dartz.dart';

import '../../../../core/models/movie.dart';
import '../../../../core/models/tv.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/service_locator.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either> fetchPopularMovies() async {
    try {
      var data = await getIt.get<ApiService>().get(endPoint: 'movie/popular');
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
  Future<Either> fetchTopRatedMovies() async {
    try {
      var data = await getIt.get<ApiService>().get(endPoint: 'movie/top_rated');
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
  Future<Either> fetchTrendingMovies() async {
    try {
      var data = await getIt.get<ApiService>().get(
        endPoint: 'trending/movie/week',
        // endPoint: 'movie/now_playing',
      );
      List<Movie> movies = [];
      for (var i = 0; i < 12; i++) {
        movies.add(Movie.fromMap(data['results'][i]));
      }
      // for (var element in data['results']) {
      //   movies.add(Movie.fromMap(element));
      // }
      return right(movies);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> fetchUpcomingMovies() async {
    try {
      var data = await getIt.get<ApiService>().get(endPoint: 'movie/upcoming');
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
  Future<Either> fetchPopularTv() async {
    try {
      var data = await getIt.get<ApiService>().get(endPoint: 'tv/popular');
      List<Tv> tvs = [];
      for (var element in data['results']) {
        tvs.add(Tv.fromMap(element));
      }
      return right(tvs);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> fetchTopRatedTv() async {
    try {
      var data = await getIt.get<ApiService>().get(endPoint: 'tv/top_rated');
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
