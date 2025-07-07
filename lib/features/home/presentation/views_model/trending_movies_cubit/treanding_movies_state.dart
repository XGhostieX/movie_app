part of 'trending_movies_cubit.dart';

sealed class TrendingMoviesState extends Equatable {
  const TrendingMoviesState();

  @override
  List<Object> get props => [];
}

final class TrendingMoviesInitial extends TrendingMoviesState {}

final class TrendingMoviesLoading extends TrendingMoviesState {}

final class TrendingMoviesSuccess extends TrendingMoviesState {
  final List<Movie> movies;

  const TrendingMoviesSuccess(this.movies);
}

final class TrendingMoviesFailure extends TrendingMoviesState {
  final String errMsg;

  const TrendingMoviesFailure(this.errMsg);
}
