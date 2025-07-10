import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../views_model/popular_movies_cubit/popular_movies_cubit.dart';
import '../../../../../core/widgets/movie_card.dart';

class PopularMoviesListview extends StatelessWidget {
  const PopularMoviesListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
      builder: (context, state) {
        if (state is PopularMoviesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PopularMoviesSuccess) {
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
        } else if (state is PopularMoviesFailure) {
          return Center(child: Text(state.errMsg));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
