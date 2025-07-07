import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/tv.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../data/repos/home_repo.dart';

part 'top_rated_tv_state.dart';

class TopRatedTvCubit extends Cubit<TopRatedTvState> {
  TopRatedTvCubit() : super(TopRatedTvInitial());
  Future<void> fetchTopRatedTv() async {
    emit(TopRatedTvLoading());
    var result = await getIt.get<HomeRepo>().fetchTopRatedTv();
    result.fold(
      (failure) => emit(TopRatedTvFailure(failure)),
      (tv) => emit(TopRatedTvSuccess(tv)),
    );
  }
}
