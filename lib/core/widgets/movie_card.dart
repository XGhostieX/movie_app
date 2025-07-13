import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../theme/app_colors.dart';
import '../utils/app_navigator.dart';
import '../utils/assets.dart';
import '../../features/details/presentation/views/movie_details_view.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AppNavigator.push(context, MovieDetailsView(movie: movie)),
      child: Stack(
        children: [
          Container(
            width: 167,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Expanded(
                //   flex: 4,

                //   child: Container(
                //     decoration: BoxDecoration(
                //       color: Colors.transparent,
                //       image: DecorationImage(
                //         fit: BoxFit.fill,
                //         image: NetworkImage(
                //           Assets.baseImageUrl + movie.posterPath!,
                //         ),
                //       ),
                //       borderRadius: const BorderRadius.all(Radius.circular(10)),
                //     ),
                //   ),
                // ),
                Expanded(
                  flex: 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      // height: 100,
                      // width: 100,
                      imageUrl: '${Assets.baseImageUrl}${movie.posterPath}',
                      errorWidget: (context, url, error) =>
                          const Center(child: Icon(Icons.error_rounded)),
                    ),
                  ),
                ),
                Expanded(
                  // flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title!,
                          style: const TextStyle(
                            fontSize: 18,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: Row(
              children: [
                const Icon(Icons.star, size: 18, color: Colors.amber),
                Text(
                  ' ${movie.voteAverage!.toStringAsFixed(1)}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
