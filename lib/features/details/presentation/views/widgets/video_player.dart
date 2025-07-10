import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../views_model/trailer_cubit/trailer_cubit.dart';

class VideoPlayer extends StatelessWidget {
  const VideoPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrailerCubit, TrailerState>(
      builder: (context, state) {
        if (state is TrailerLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TrailerSuccess) {
          return YoutubePlayer(
            controller: state.youtubePlayerController,
            showVideoProgressIndicator: true,
            progressIndicatorColor: AppColors.primary,
            progressColors: const ProgressBarColors(
              playedColor: AppColors.primary,
              handleColor: AppColors.primary,
            ),
          );
        } else if (state is TrailerFailure) {
          return Center(child: Text(state.errMsg));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
