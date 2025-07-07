part of 'top_rated_movies_cubit.dart';

sealed class TopRatedMoviesState extends Equatable {
  const TopRatedMoviesState();

  @override
  List<Object> get props => [];
}

final class TopRatedMoviesInitial extends TopRatedMoviesState {}

final class TopRatedMoviesLoading extends TopRatedMoviesState {}

final class TopRatedMoviesSuccess extends TopRatedMoviesState {
  final List<Movie> movies;

  const TopRatedMoviesSuccess(this.movies);
}

final class TopRatedMoviesFailure extends TopRatedMoviesState {
  final String errMsg;

  const TopRatedMoviesFailure(this.errMsg);
}
