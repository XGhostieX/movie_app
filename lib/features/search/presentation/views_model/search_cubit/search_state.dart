part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchMoviesSuccess extends SearchState {
  final List<Movie> movies;

  const SearchMoviesSuccess(this.movies);
}

final class SearchTvSuccess extends SearchState {
  final List<Tv> tv;

  const SearchTvSuccess(this.tv);
}

final class SearchFailure extends SearchState {
  final String errMsg;

  const SearchFailure(this.errMsg);
}
