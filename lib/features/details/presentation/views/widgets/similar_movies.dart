import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/movie_card.dart';
import '../../../../../core/widgets/shimmer_skeleton.dart';
import '../../views_model/similar_movies_cubit/similar_movies_cubit.dart';

class SimilarMovies extends StatelessWidget {
  const SimilarMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarMoviesCubit, SimilarMoviesState>(
      builder: (context, state) {
        if (state is SimilarMoviesLoading) {
          return const ShimmerSkeleton();
        } else if (state is SimilarMoviesSuccess) {
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
        } else if (state is SimilarMoviesFailure) {
          return Center(child: Text(state.errMsg));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
