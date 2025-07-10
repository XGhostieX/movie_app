import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/tv.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../data/repos/details_repo.dart';

part 'recommendations_tv_state.dart';

class RecommendationsTvCubit extends Cubit<RecommendationsTvState> {
  RecommendationsTvCubit() : super(RecommendationsTvInitial());

  Future<void> fetchRecommendationsTv(int id) async {
    emit(RecommendationsTvLoading());
    var result = await getIt.get<DetailsRepo>().fetchRecommendationsTv(id);
    result.fold(
      (failure) => emit(RecommendationsTvFailure(failure)),
      (tv) => emit(RecommendationsTvSuccess(tv)),
    );
  }
}
