import '../models/cast.dart';
import '../models/genre.dart';
import '../models/movie.dart';
import '../models/review/review.dart';
import '../models/trailer.dart';
import '../models/tv.dart';

abstract class Mapper {
  List<Movie> movieMapper(Map<String, dynamic> data);
  List<Tv> tvMapper(Map<String, dynamic> data);
  List<Trailer> trailerMapper(Map<String, dynamic> data);
  List<Genre> genresMapper(Map<String, dynamic> data);
  List<Cast> castMapper(Map<String, dynamic> data);
  List<Review> reviewsMapper(Map<String, dynamic> data);
}

class MapperImpl implements Mapper {
  @override
  List<Movie> movieMapper(Map<String, dynamic> data) {
    List<Movie> movies = [];
    for (var element in data['results']) {
      movies.add(Movie.fromMap(element));
    }
    return movies;
  }

  @override
  List<Tv> tvMapper(Map<String, dynamic> data) {
    List<Tv> tvs = [];
    for (var element in data['results']) {
      tvs.add(Tv.fromMap(element));
    }
    return tvs;
  }

  @override
  List<Trailer> trailerMapper(Map<String, dynamic> data) {
    List<Trailer> trailers = [];
    for (var element in data['results']) {
      if (element['type'] == 'Trailer') {
        trailers.add(Trailer.fromJson(element));
      }
    }
    return trailers;
  }

  @override
  List<Genre> genresMapper(Map<String, dynamic> data) {
    List<Genre> genres = [];
    for (var element in data['genres']) {
      genres.add(Genre.fromJson(element));
    }
    return genres;
  }

  @override
  List<Cast> castMapper(Map<String, dynamic> data) {
    List<Cast> cast = [];
    for (var element in data['cast']) {
      cast.add(Cast.fromJson(element));
    }
    return cast;
  }

  @override
  List<Review> reviewsMapper(Map<String, dynamic> data) {
    List<Review> reviews = [];
    for (var element in data['results']) {
      reviews.add(Review.fromJson(element));
    }
    return reviews;
  }
}
