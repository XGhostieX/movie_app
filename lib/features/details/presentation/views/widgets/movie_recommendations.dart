import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/movie_card.dart';
import '../../views_model/recommendations_movies_cubit/recommendations_movies_cubit.dart';

class MovieRecommendations extends StatelessWidget {
  const MovieRecommendations({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendationsMoviesCubit, RecommendationsMoviesState>(
      builder: (context, state) {
        if (state is RecommendationsMoviesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is RecommendationsMoviesSuccess) {
          return SizedBox(
            height: 300,
            child: ListView.separated(
              itemCount: state.movies.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) =>
                  MovieCard(movie: state.movies[index]),
            ),
          );
        } else if (state is RecommendationsMoviesFailure) {
          return Center(child: Text(state.errMsg));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
