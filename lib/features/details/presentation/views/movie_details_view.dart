import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/movie.dart';
import '../../../../core/widgets/basic_appbar.dart';
import '../views_model/cast_cubit/cast_cubit.dart';
import '../views_model/genres_cubit/genres_cubit.dart';
import '../views_model/recommendations_movies_cubit/recommendations_movies_cubit.dart';
import '../views_model/reviews_cubit/reviews_cubit.dart';
import '../views_model/similar_movies_cubit/similar_movies_cubit.dart';
import '../views_model/trailer_cubit/trailer_cubit.dart';
import 'widgets/movie_details_view_body.dart';

class MovieDetailsView extends StatelessWidget {
  final Movie movie;
  const MovieDetailsView({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TrailerCubit()..fetchMovieTrailer(movie.id!),
        ),
        BlocProvider(
          create: (context) => GenresCubit()..fetchMovieGenres(movie.id!),
        ),
        BlocProvider(
          create: (context) => CastCubit()..fetchMovieCast(movie.id!),
        ),
        BlocProvider(
          create: (context) => ReviewsCubit()..fetchMovieReviews(movie.id!),
        ),
        BlocProvider(
          create: (context) =>
              RecommendationsMoviesCubit()
                ..fetchRecommendationsMovies(movie.id!),
        ),
        BlocProvider(
          create: (context) =>
              SimilarMoviesCubit()..fetchSimilarMovies(movie.id!),
        ),
      ],
      child: Scaffold(
        appBar: const BasicAppbar(hideBack: false),
        body: MovieDetailsViewBody(movie: movie),
      ),
    );
  }
}
