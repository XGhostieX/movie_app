import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/movie_card.dart';
import '../../../../../core/widgets/tv_card.dart';
import '../../views_model/search_cubit/search_cubit.dart';

class SearchGridview extends StatelessWidget {
  const SearchGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchMoviesSuccess) {
          return GridView.builder(
            itemCount: state.movies.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.57,
            ),
            itemBuilder: (context, index) =>
                MovieCard(movie: state.movies[index]),
          );
        } else if (state is SearchTvSuccess) {
          return GridView.builder(
            itemCount: state.tv.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.57,
            ),
            itemBuilder: (context, index) => TvCard(tv: state.tv[index]),
          );
        } else if (state is SearchFailure) {
          return Center(child: Text(state.errMsg));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
