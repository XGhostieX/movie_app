part of 'similar_tv_cubit.dart';

sealed class SimilarTvState extends Equatable {
  const SimilarTvState();

  @override
  List<Object> get props => [];
}

final class SimilarTvInitial extends SimilarTvState {}

final class SimilarTvLoading extends SimilarTvState {}

final class SimilarTvSuccess extends SimilarTvState {
  final List<Tv> tv;

  const SimilarTvSuccess(this.tv);
}

final class SimilarTvFailure extends SimilarTvState {
  final String errMsg;

  const SimilarTvFailure(this.errMsg);
}
