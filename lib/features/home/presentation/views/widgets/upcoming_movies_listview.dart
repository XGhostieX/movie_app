import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/cubit/generic_cubit.dart';
import '../../../../../core/models/movie.dart';
import '../../../../../core/utils/api_url.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/widgets/shimmer_skeleton.dart';
import '../../../../../core/widgets/movie_card.dart';
import '../../../data/repos/home_repo.dart';

class UpcomingMoviesListview extends StatelessWidget {
  const UpcomingMoviesListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericCubit()
        ..fetchData<List<Movie>>(
          getIt.get<HomeRepo>().fetchMovies(ApiUrl.upcomingMovies),
        ),
      child: BlocBuilder<GenericCubit, GenericState>(
        builder: (context, state) {
          if (state is GenericLoading) {
            return const ShimmerSkeleton();
          } else if (state is GenericSuccess) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                itemCount: state.data.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemBuilder: (context, index) =>
                    MovieCard(movie: state.data[index]),
              ),
            );
          } else if (state is GenericFailure) {
            return Center(child: Text(state.errMsg));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
