import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/assets.dart';
import '../../views_model/trending_movies_cubit/trending_movies_cubit.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingMoviesCubit, TrendingMoviesState>(
      builder: (context, state) {
        if (state is TrendingMoviesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TrendingMoviesSuccess) {
          return FanCarouselImageSlider.sliderType1(
            imagesLink: state.movies
                .map((e) => Assets.baseImageUrl + e.posterPath.toString())
                .toList(),
            isAssets: false,
            autoPlay: true,
            sliderHeight: MediaQuery.of(context).size.height * 0.40,
            showIndicator: true,
            imageFitMode: BoxFit.fill,
            indicatorActiveColor: AppColors.primary,
          );
        } else if (state is TrendingMoviesFailure) {
          return Center(child: Text(state.errMsg));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
