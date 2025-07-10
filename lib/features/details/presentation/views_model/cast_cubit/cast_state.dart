part of 'cast_cubit.dart';

sealed class CastState extends Equatable {
  const CastState();

  @override
  List<Object> get props => [];
}

final class CastInitial extends CastState {}

final class CastLoading extends CastState {}

final class CastSuccess extends CastState {
  final List<Cast> cast;

  const CastSuccess(this.cast);
}

final class CastFailure extends CastState {
  final String errMsg;

  const CastFailure(this.errMsg);
}
