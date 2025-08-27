import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../core/models/trailer.dart';
import '../../../data/repos/details_repo.dart';

part 'trailer_state.dart';

class TrailerCubit extends Cubit<TrailerState> {
  final DetailsRepo detailsRepo;
  TrailerCubit(this.detailsRepo) : super(TrailerInitial());

  Future<void> fetchMovieTrailer(int id) async {
    emit(TrailerLoading());
    var result = await detailsRepo.fetchTrailer('movie/$id/videos');
    result.fold((failure) => emit(TrailerFailure(failure)), (trailers) {
      Trailer trailer = trailers;
      YoutubePlayerController controller = YoutubePlayerController(
        initialVideoId: trailer.key!,
        flags: const YoutubePlayerFlags(autoPlay: false),
      );
      emit(TrailerSuccess(controller));
    });
  }

  Future<void> fetchTvTrailer(int id) async {
    emit(TrailerLoading());
    var result = await detailsRepo.fetchTrailer('tv/$id/videos');
    result.fold((failure) => emit(TrailerFailure(failure)), (trailers) {
      Trailer trailer = trailers;
      YoutubePlayerController controller = YoutubePlayerController(
        initialVideoId: trailer.key!,
        flags: const YoutubePlayerFlags(autoPlay: false),
      );
      emit(TrailerSuccess(controller));
    });
  }
}
