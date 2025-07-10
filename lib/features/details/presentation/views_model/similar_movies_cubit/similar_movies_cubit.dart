import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/movie.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../data/repos/details_repo.dart';

part 'similar_movies_state.dart';

class SimilarMoviesCubit extends Cubit<SimilarMoviesState> {
  SimilarMoviesCubit() : super(SimilarMoviesInitial());

  Future<void> fetchSimilarMovies(int id) async {
    emit(SimilarMoviesLoading());
    var result = await getIt.get<DetailsRepo>().fetchSimilarMovies(id);
    result.fold(
      (failure) => emit(SimilarMoviesFailure(failure)),
      (movies) => emit(SimilarMoviesSuccess(movies)),
    );
  }
}
