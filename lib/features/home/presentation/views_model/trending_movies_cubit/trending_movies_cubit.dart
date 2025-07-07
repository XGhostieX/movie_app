import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/movie.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../data/repos/home_repo.dart';

part 'treanding_movies_state.dart';

class TrendingMoviesCubit extends Cubit<TrendingMoviesState> {
  TrendingMoviesCubit() : super(TrendingMoviesInitial());
  Future<void> fetchTrendingMovies() async {
    emit(TrendingMoviesLoading());
    var result = await getIt.get<HomeRepo>().fetchTrendingMovies();
    result.fold(
      (failure) => emit(TrendingMoviesFailure(failure)),
      (movies) => emit(TrendingMoviesSuccess(movies)),
    );
  }
}
