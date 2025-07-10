part of 'reviews_cubit.dart';

sealed class ReviewsState extends Equatable {
  const ReviewsState();

  @override
  List<Object> get props => [];
}

final class ReviewsInitial extends ReviewsState {}

final class ReviewsLoading extends ReviewsState {}

final class ReviewsSuccess extends ReviewsState {
  final List<Review> reviews;

  const ReviewsSuccess(this.reviews);
}

final class ReviewsFailure extends ReviewsState {
  final String errMsg;

  const ReviewsFailure(this.errMsg);
}
