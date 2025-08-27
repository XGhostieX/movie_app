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
  final String endPoint;
  const MovieDetailsViewBody({
    super.key,
    required this.movie,
    required this.endPoint,
  });

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
                GenresChip(endPoint: endPoint),
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
                CastListview(endPoint: endPoint),
                const SizedBox(height: 15),
                const CategoryTitle(title: 'Reviews'),
                const SizedBox(height: 15),
                ReviewsListview(endPoint: endPoint),
                const SizedBox(height: 15),
                const CategoryTitle(title: 'Recommendations'),
                const SizedBox(height: 15),
              ],
            ),
          ),
          MovieRecommendations(endPoint: endPoint),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CategoryTitle(title: 'Similar Movies'),
          ),
          const SizedBox(height: 15),
          SimilarMovies(endPoint: endPoint),
        ],
      ),
    );
  }
}
