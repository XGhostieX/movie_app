import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/movie.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../data/repos/details_repo.dart';

part 'recommendations_movies_state.dart';

class RecommendationsMoviesCubit extends Cubit<RecommendationsMoviesState> {
  RecommendationsMoviesCubit() : super(RecommendationsMoviesInitial());

  Future<void> fetchRecommendationsMovies(int id) async {
    emit(RecommendationsMoviesLoading());
    var result = await getIt.get<DetailsRepo>().fetchRecommendationsMovies(id);
    result.fold(
      (failure) => emit(RecommendationsMoviesFailure(failure)),
      (movies) => emit(RecommendationsMoviesSuccess(movies)),
    );
  }
}
