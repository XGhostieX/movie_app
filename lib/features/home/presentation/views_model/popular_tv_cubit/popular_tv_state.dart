part of 'popular_tv_cubit.dart';

sealed class PopularTvState extends Equatable {
  const PopularTvState();

  @override
  List<Object> get props => [];
}

final class PopularTvInitial extends PopularTvState {}

final class PopularTvLoading extends PopularTvState {}

final class PopularTvSuccess extends PopularTvState {
  final List<Tv> tv;

  const PopularTvSuccess(this.tv);
}

final class PopularTvFailure extends PopularTvState {
  final String errMsg;

  const PopularTvFailure(this.errMsg);
}
