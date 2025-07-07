import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/data/repos/home_repo.dart';

import '../../../../../core/models/movie.dart';
import '../../../../../core/utils/service_locator.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  PopularMoviesCubit() : super(PopularMoviesInitial());

  Future<void> fetchPopularMovies() async {
    emit(PopularMoviesLoading());
    var result = await getIt.get<HomeRepo>().fetchPopularMovies();
    result.fold(
      (failure) => emit(PopularMoviesFailure(failure)),
      (movies) => emit(PopularMoviesSuccess(movies)),
    );
  }
}
