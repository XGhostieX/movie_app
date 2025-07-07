import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/movie.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../data/repos/home_repo.dart';

part 'top_rated_movies_state.dart';

class TopRatedMoviesCubit extends Cubit<TopRatedMoviesState> {
  TopRatedMoviesCubit() : super(TopRatedMoviesInitial());
  Future<void> fetchTopRatedMovies() async {
    emit(TopRatedMoviesLoading());
    var result = await getIt.get<HomeRepo>().fetchTopRatedMovies();
    result.fold(
      (failure) => emit(TopRatedMoviesFailure(failure)),
      (movies) => emit(TopRatedMoviesSuccess(movies)),
    );
  }
}
