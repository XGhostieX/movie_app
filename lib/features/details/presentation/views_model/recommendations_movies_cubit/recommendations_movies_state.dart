part of 'recommendations_movies_cubit.dart';

sealed class RecommendationsMoviesState extends Equatable {
  const RecommendationsMoviesState();

  @override
  List<Object> get props => [];
}

final class RecommendationsMoviesInitial extends RecommendationsMoviesState {}

final class RecommendationsMoviesLoading extends RecommendationsMoviesState {}

final class RecommendationsMoviesSuccess extends RecommendationsMoviesState {
  final List<Movie> movies;

  const RecommendationsMoviesSuccess(this.movies);
}

final class RecommendationsMoviesFailure extends RecommendationsMoviesState {
  final String errMsg;

  const RecommendationsMoviesFailure(this.errMsg);
}
