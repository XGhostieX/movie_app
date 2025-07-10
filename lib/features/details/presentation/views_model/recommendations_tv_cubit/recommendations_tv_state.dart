part of 'recommendations_tv_cubit.dart';

sealed class RecommendationsTvState extends Equatable {
  const RecommendationsTvState();

  @override
  List<Object> get props => [];
}

final class RecommendationsTvInitial extends RecommendationsTvState {}

final class RecommendationsTvLoading extends RecommendationsTvState {}

final class RecommendationsTvSuccess extends RecommendationsTvState {
  final List<Tv> tv;

  const RecommendationsTvSuccess(this.tv);
}

final class RecommendationsTvFailure extends RecommendationsTvState {
  final String errMsg;

  const RecommendationsTvFailure(this.errMsg);
}
