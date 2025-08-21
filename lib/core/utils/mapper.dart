import '../models/movie.dart';
import '../models/tv.dart';

abstract class Mapper {
  List<Movie> movieMapper(Map<String, dynamic> data);
  List<Tv> tvMapper(Map<String, dynamic> data);
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
    return (tvs);
  }
}
