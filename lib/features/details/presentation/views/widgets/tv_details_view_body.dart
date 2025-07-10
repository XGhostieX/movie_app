import 'package:flutter/material.dart';

import '../../../../../core/models/tv.dart';
import 'cast_listview.dart';
import 'category_title.dart';
import 'genres_chip.dart';
import 'release_date_rate.dart';
import 'reviews_listview.dart';
import 'similar_tv.dart';
import 'tv_recommendations.dart';
import 'video_player.dart';

class TvDetailsViewBody extends StatelessWidget {
  final Tv tv;
  const TvDetailsViewBody({super.key, required this.tv});

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
                CategoryTitle(title: tv.name!),
                const SizedBox(height: 15),
                const GenresChip(),
                const SizedBox(height: 15),
                ReleaseDateRate(
                  releaseDate: tv.firstAirDate!,
                  voteAverage: tv.voteAverage!,
                ),
                const SizedBox(height: 15),
                const CategoryTitle(title: 'Overview'),
                const SizedBox(height: 15),
                Text(
                  tv.overview!,
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
          const TvRecommendations(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CategoryTitle(title: 'Similar TV-Shows'),
          ),
          const SizedBox(height: 15),
          const SimilarTv(),
        ],
      ),
    );
  }
}
