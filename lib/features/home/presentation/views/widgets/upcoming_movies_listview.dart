import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../views_model/upcoming_movies_cubit/upcoming_movies_cubit.dart';
import '../../../../../core/widgets/movie_card.dart';

class UpcomingMoviesListview extends StatelessWidget {
  const UpcomingMoviesListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingMoviesCubit, UpcomingMoviesState>(
      builder: (context, state) {
        if (state is UpcomingMoviesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UpcomingMoviesSuccess) {
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
        } else if (state is UpcomingMoviesFailure) {
          return Center(child: Text(state.errMsg));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
