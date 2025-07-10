import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/cast.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../data/repos/details_repo.dart';

part 'cast_state.dart';

class CastCubit extends Cubit<CastState> {
  CastCubit() : super(CastInitial());

  Future<void> fetchMovieCast(int id) async {
    emit(CastLoading());
    var result = await getIt.get<DetailsRepo>().fetchMovieCast(id);
    result.fold(
      (failure) => emit(CastFailure(failure)),
      (cast) => emit(CastSuccess(cast)),
    );
  }

  Future<void> fetchTvCast(int id) async {
    emit(CastLoading());
    var result = await getIt.get<DetailsRepo>().fetchTvCast(id);
    result.fold(
      (failure) => emit(CastFailure(failure)),
      (cast) => emit(CastSuccess(cast)),
    );
  }
}
