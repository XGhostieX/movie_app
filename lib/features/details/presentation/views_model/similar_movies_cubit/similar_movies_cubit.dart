import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/movie.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../home/data/repos/home_repo.dart';

part 'similar_movies_state.dart';

class SimilarMoviesCubit extends Cubit<SimilarMoviesState> {
  SimilarMoviesCubit() : super(SimilarMoviesInitial());

  Future<void> fetchSimilarMovies(int id) async {
    emit(SimilarMoviesLoading());
    var result = await getIt.get<HomeRepo>().fetchMovies('movie/$id/similar');
    result.fold(
      (failure) => emit(SimilarMoviesFailure(failure)),
      (movies) => emit(SimilarMoviesSuccess(movies)),
    );
  }
}
