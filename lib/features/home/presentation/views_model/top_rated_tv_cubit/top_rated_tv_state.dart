part of 'top_rated_tv_cubit.dart';

sealed class TopRatedTvState extends Equatable {
  const TopRatedTvState();

  @override
  List<Object> get props => [];
}

final class TopRatedTvInitial extends TopRatedTvState {}

final class TopRatedTvLoading extends TopRatedTvState {}

final class TopRatedTvSuccess extends TopRatedTvState {
  final List<Tv> tv;

  const TopRatedTvSuccess(this.tv);
}

final class TopRatedTvFailure extends TopRatedTvState {
  final String errMsg;

  const TopRatedTvFailure(this.errMsg);
}
