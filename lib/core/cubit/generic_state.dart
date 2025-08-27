part of 'generic_cubit.dart';

sealed class GenericState extends Equatable {
  const GenericState();

  @override
  List<Object> get props => [];
}

final class GenericInitial extends GenericState {}

final class GenericLoading extends GenericState {}

final class GenericSuccess<T> extends GenericState {
  final T data;

  const GenericSuccess(this.data);
}

final class GenericFailure extends GenericState {
  final String errMsg;

  const GenericFailure(this.errMsg);
}
