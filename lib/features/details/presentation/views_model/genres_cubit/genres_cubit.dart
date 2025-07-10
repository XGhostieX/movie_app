import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/genre.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../data/repos/details_repo.dart';

part 'genres_state.dart';

class GenresCubit extends Cubit<GenresState> {
  GenresCubit() : super(GenresInitial());

  Future<void> fetchMovieGenres(int id) async {
    emit(GenresLoading());
    var result = await getIt.get<DetailsRepo>().fetchMovieGenres(id);
    result.fold(
      (failure) => emit(GenresFailure(failure)),
      (genres) => emit(GenresSuccess(genres)),
    );
  }

  Future<void> fetchTvGenres(int id) async {
    emit(GenresLoading());
    var result = await getIt.get<DetailsRepo>().fetchTvGenres(id);
    result.fold(
      (failure) => emit(GenresFailure(failure)),
      (keywords) => emit(GenresSuccess(keywords)),
    );
  }
}
