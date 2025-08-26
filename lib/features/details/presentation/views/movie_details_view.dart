import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/movie.dart';
import '../../../../core/widgets/basic_appbar.dart';
import '../views_model/trailer_cubit/trailer_cubit.dart';
import 'widgets/movie_details_view_body.dart';

class MovieDetailsView extends StatelessWidget {
  final Movie movie;
  const MovieDetailsView({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrailerCubit()..fetchMovieTrailer(movie.id!),
      child: Scaffold(
        appBar: const BasicAppbar(hideBack: false),
        body: MovieDetailsViewBody(movie: movie, endPoint: 'movie/${movie.id}'),
      ),
    );
  }
}
