part of 'upcoming_movies_cubit.dart';

sealed class UpcomingMoviesState extends Equatable {
  const UpcomingMoviesState();

  @override
  List<Object> get props => [];
}

final class UpcomingMoviesInitial extends UpcomingMoviesState {}

final class UpcomingMoviesLoading extends UpcomingMoviesState {}

final class UpcomingMoviesSuccess extends UpcomingMoviesState {
  final List<Movie> movies;

  const UpcomingMoviesSuccess(this.movies);
}

final class UpcomingMoviesFailure extends UpcomingMoviesState {
  final String errMsg;

  const UpcomingMoviesFailure(this.errMsg);
}
