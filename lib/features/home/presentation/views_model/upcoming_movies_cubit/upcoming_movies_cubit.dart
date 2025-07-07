import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/movie.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../data/repos/home_repo.dart';

part 'upcoming_movies_state.dart';

class UpcomingMoviesCubit extends Cubit<UpcomingMoviesState> {
  UpcomingMoviesCubit() : super(UpcomingMoviesInitial());
  Future<void> fetchUpcomingMovies() async {
    emit(UpcomingMoviesLoading());
    var result = await getIt.get<HomeRepo>().fetchUpcomingMovies();
    result.fold(
      (failure) => emit(UpcomingMoviesFailure(failure)),
      (movies) => emit(UpcomingMoviesSuccess(movies)),
    );
  }
}
