abstract class ApiConfig {
  static const String baseUrl = 'https://api.themoviedb.org';
  static const String apiVersion = '/3/';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500/';
  static const String baseTrailerUrl = 'https://www.youtube.com/watch?v=';
}

class HomeEndpoints {
  static const String trendingMovies = 'trending/movie/week';
  static const String popularMovies = 'movie/popular';
  static const String topRatedMovies = 'movie/top_rated';
  static const String popularTv = 'tv/popular';
  static const String topRatedTv = 'tv/top_rated';
  static const String upcomingMovies = 'movie/upcoming';
}
