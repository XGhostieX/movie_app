part of 'genres_cubit.dart';

sealed class GenresState extends Equatable {
  const GenresState();

  @override
  List<Object> get props => [];
}

final class GenresInitial extends GenresState {}

final class GenresLoading extends GenresState {}

final class GenresSuccess extends GenresState {
  final List<Genre> genres;

  const GenresSuccess(this.genres);
}

final class GenresFailure extends GenresState {
  final String errMsg;

  const GenresFailure(this.errMsg);
}
