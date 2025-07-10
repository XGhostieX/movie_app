import 'package:dartz/dartz.dart';

import '../../../../core/models/cast.dart';
import '../../../../core/models/genre.dart';
import '../../../../core/models/movie.dart';
import '../../../../core/models/review/review.dart';
import '../../../../core/models/trailer.dart';

import '../../../../core/models/tv.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/service_locator.dart';
import 'details_repo.dart';

class DetailsRepoImpl implements DetailsRepo {
  @override
  Future<Either> fetchMovieTrailer(int id) async {
    try {
      var data = await getIt.get<ApiService>().get(
        endPoint: 'movie/$id/videos',
      );
      List<Trailer> trailers = [];
      for (var element in data['results']) {
        if (element['type'] == 'Trailer') {
          trailers.add(Trailer.fromJson(element));
        }
      }
      return right(trailers[0]);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> fetchTvTrailer(int id) async {
    try {
      var data = await getIt.get<ApiService>().get(endPoint: 'tv/$id/videos');
      List<Trailer> trailers = [];
      for (var element in data['results']) {
        if (element['type'] == 'Trailer') {
          trailers.add(Trailer.fromJson(element));
        }
      }
      return right(trailers[0]);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> fetchRecommendationsMovies(int id) async {
    try {
      var data = await getIt.get<ApiService>().get(
        endPoint: 'movie/$id/recommendations',
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
  Future<Either> fetchRecommendationsTv(int id) async {
    try {
      var data = await getIt.get<ApiService>().get(
        endPoint: 'tv/$id/recommendations',
      );
      List<Tv> tv = [];
      for (var element in data['results']) {
        tv.add(Tv.fromMap(element));
      }
      return right(tv);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> fetchSimilarMovies(int id) async {
    try {
      var data = await getIt.get<ApiService>().get(
        endPoint: 'movie/$id/similar',
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
  Future<Either> fetchSimilarTv(int id) async {
    try {
      var data = await getIt.get<ApiService>().get(endPoint: 'tv/$id/similar');
      List<Tv> tv = [];
      for (var element in data['results']) {
        tv.add(Tv.fromMap(element));
      }
      return right(tv);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> fetchMovieGenres(int id) async {
    try {
      var data = await getIt.get<ApiService>().get(endPoint: 'movie/$id');
      List<Genre> genres = [];

      for (var element in data['genres']) {
        genres.add(Genre.fromJson(element));
      }
      return right(genres);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> fetchTvGenres(int id) async {
    try {
      var data = await getIt.get<ApiService>().get(endPoint: 'tv/$id');
      List<Genre> genres = [];

      for (var element in data['genres']) {
        genres.add(Genre.fromJson(element));
      }
      return right(genres);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> fetchMovieCast(int id) async {
    try {
      var data = await getIt.get<ApiService>().get(
        endPoint: 'movie/$id/credits',
      );
      List<Cast> cast = [];

      for (var element in data['cast']) {
        cast.add(Cast.fromJson(element));
      }
      return right(cast);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> fetchTvCast(int id) async {
    try {
      var data = await getIt.get<ApiService>().get(endPoint: 'tv/$id/credits');
      List<Cast> cast = [];

      for (var element in data['cast']) {
        cast.add(Cast.fromJson(element));
      }
      return right(cast);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> fetchMovieReviews(int id) async {
    try {
      var data = await getIt.get<ApiService>().get(
        endPoint: 'movie/$id/reviews',
      );
      List<Review> reviews = [];

      for (var element in data['results']) {
        reviews.add(Review.fromJson(element));
      }
      return right(reviews);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> fetchTvReviews(int id) async {
    try {
      var data = await getIt.get<ApiService>().get(endPoint: 'tv/$id/reviews');
      List<Review> reviews = [];

      for (var element in data['results']) {
        reviews.add(Review.fromJson(element));
      }
      return right(reviews);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
