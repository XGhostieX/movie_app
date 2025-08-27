import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'generic_state.dart';

class GenericCubit extends Cubit<GenericState> {
  GenericCubit() : super(GenericInitial());

  Future<void> fetchData<T>(Future data) async {
    emit(GenericLoading());
    var result = await data;
    result.fold(
      (failure) => emit(GenericFailure(failure)),
      (data) => emit(GenericSuccess<T>(data)),
    );
  }
}
