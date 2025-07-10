import 'package:flutter/material.dart';
import 'package:movie_app/features/details/presentation/views/widgets/reviews_listview.dart';

import '../../../../../core/models/movie.dart';
import 'cast_listview.dart';
import 'category_title.dart';
import 'genres_chip.dart';
import 'movie_recommendations.dart';
import 'release_date_rate.dart';
import 'similar_movies.dart';
import 'video_player.dart';

class MovieDetailsViewBody extends StatelessWidget {
  final Movie movie;
  const MovieDetailsViewBody({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VideoPlayer(),
                const SizedBox(height: 15),
                CategoryTitle(title: movie.title!),
                const SizedBox(height: 15),
                const GenresChip(),
                const SizedBox(height: 15),
                ReleaseDateRate(
                  releaseDate: movie.releaseDate!,
                  voteAverage: movie.voteAverage!,
                ),
                const SizedBox(height: 15),
                const CategoryTitle(title: 'Overview'),
                const SizedBox(height: 15),
                Text(
                  movie.overview!,
                  style: Theme.of(context).primaryTextTheme.bodyMedium,
                ),
                const SizedBox(height: 15),
                const CategoryTitle(title: 'Cast'),
                const SizedBox(height: 15),
                const CastListview(),
                const SizedBox(height: 15),
                const CategoryTitle(title: 'Reviews'),
                const SizedBox(height: 15),
                const ReviewsListview(),
                const SizedBox(height: 15),
                const CategoryTitle(title: 'Recommendations'),
                const SizedBox(height: 15),
              ],
            ),
          ),
          const MovieRecommendations(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CategoryTitle(title: 'Similar Movies'),
          ),
          const SizedBox(height: 15),
          const SimilarMovies(),
        ],
      ),
    );
  }
}
