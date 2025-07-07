import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/data/repos/home_repo.dart';

import '../../../../../core/models/tv.dart';
import '../../../../../core/utils/service_locator.dart';

part 'popular_tv_state.dart';

class PopularTvCubit extends Cubit<PopularTvState> {
  PopularTvCubit() : super(PopularTvInitial());

  Future<void> fetchPopularTv() async {
    emit(PopularTvLoading());
    var result = await getIt.get<HomeRepo>().fetchPopularTv();
    result.fold(
      (failure) => emit(PopularTvFailure(failure)),
      (tv) => emit(PopularTvSuccess(tv)),
    );
  }
}
