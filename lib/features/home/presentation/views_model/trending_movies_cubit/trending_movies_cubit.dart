import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/movie.dart';
import '../../../../../core/utils/api_url.dart';
import '../../../data/repos/home_repo.dart';

part 'treanding_movies_state.dart';

class TrendingMoviesCubit extends Cubit<TrendingMoviesState> {
  final HomeRepo homeRepo;
  TrendingMoviesCubit(this.homeRepo) : super(TrendingMoviesInitial());
  Future<void> fetchTrendingMovies() async {
    emit(TrendingMoviesLoading());
    var result = await homeRepo.fetchMovies(ApiUrl.trendingMovies);
    result.fold(
      (failure) => emit(TrendingMoviesFailure(failure)),
      (movies) => emit(TrendingMoviesSuccess(movies.sublist(0, 15))),
    );
  }
}
