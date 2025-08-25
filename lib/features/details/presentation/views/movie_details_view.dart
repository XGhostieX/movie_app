import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubit/generic_cubit.dart';
import '../../../../core/models/cast.dart';
import '../../../../core/models/genre.dart';
import '../../../../core/models/movie.dart';
import '../../../../core/models/review/review.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../../core/widgets/basic_appbar.dart';
import '../../../home/data/repos/home_repo.dart';
import '../../data/repos/details_repo.dart';
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
          create: (context) => GenericCubit()
            ..fetchData<List<Genre>>(
              getIt.get<DetailsRepo>().fetchGenres('movie/$movie.id'),
            )
            ..fetchData<List<Cast>>(
              getIt.get<DetailsRepo>().fetchCast('movie/$movie.id/credits'),
            )
            ..fetchData<List<Review>>(
              getIt.get<DetailsRepo>().fetchReviews('movie/$movie.id/reviews'),
            )
            ..fetchData<List<Movie>>(
              getIt.get<HomeRepo>().fetchMovies(
                'movie/$movie.id/recommendations',
              ),
            )
            ..fetchData<List<Movie>>(
              getIt.get<HomeRepo>().fetchMovies('movie/$movie.id/similar'),
            ),
        ),
      ],
      child: Scaffold(
        appBar: const BasicAppbar(hideBack: false),
        body: MovieDetailsViewBody(movie: movie),
      ),
    );
  }
}
