import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/movie.dart';
import '../../../../../core/models/tv.dart';
import '../../../data/repos/search_repo.dart';
import '../search_options_cubit/search_options_cubit.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo searchRepo;
  TextEditingController controller = TextEditingController();
  SearchCubit(this.searchRepo) : super(SearchInitial());

  void search(String qurey, SearchType searchType) {
    if (qurey.isNotEmpty) {
      switch (searchType) {
        case SearchType.movie:
          fetchSearchMovies(qurey);
          break;
        case SearchType.tv:
          fetchSearchTv(qurey);
          break;
      }
    }
  }

  Future<void> fetchSearchMovies(String qurey) async {
    emit(SearchLoading());
    var result = await searchRepo.fetchMovies(qurey);
    result.fold(
      (failure) => emit(SearchFailure(failure)),
      (movies) => emit(SearchMoviesSuccess(movies)),
    );
  }

  Future<void> fetchSearchTv(String qurey) async {
    emit(SearchLoading());
    var result = await searchRepo.fetchTv(qurey);
    result.fold(
      (failure) => emit(SearchFailure(failure)),
      (tv) => emit(SearchTvSuccess(tv)),
    );
  }
}
