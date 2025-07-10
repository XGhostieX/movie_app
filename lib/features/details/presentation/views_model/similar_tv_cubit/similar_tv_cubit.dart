import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/tv.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../data/repos/details_repo.dart';

part 'similar_tv_state.dart';

class SimilarTvCubit extends Cubit<SimilarTvState> {
  SimilarTvCubit() : super(SimilarTvInitial());

  Future<void> fetchSimilarTv(int id) async {
    emit(SimilarTvLoading());
    var result = await getIt.get<DetailsRepo>().fetchSimilarTv(id);
    result.fold(
      (failure) => emit(SimilarTvFailure(failure)),
      (tv) => emit(SimilarTvSuccess(tv)),
    );
  }
}
