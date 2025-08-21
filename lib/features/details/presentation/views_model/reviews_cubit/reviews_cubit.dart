import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/review/review.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../data/repos/details_repo.dart';

part 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  ReviewsCubit() : super(ReviewsInitial());

  Future<void> fetchMovieReviews(int id) async {
    emit(ReviewsLoading());
    var result = await getIt.get<DetailsRepo>().fetchReviews(
      'movie/$id/reviews',
    );
    result.fold(
      (failure) => emit(ReviewsFailure(failure)),
      (reviews) => emit(ReviewsSuccess(reviews)),
    );
  }

  Future<void> fetchTvReviews(int id) async {
    emit(ReviewsLoading());
    var result = await getIt.get<DetailsRepo>().fetchReviews('tv/$id/reviews');
    result.fold(
      (failure) => emit(ReviewsFailure(failure)),
      (reviews) => emit(ReviewsSuccess(reviews)),
    );
  }
}
