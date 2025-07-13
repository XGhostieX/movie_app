import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/tv.dart';
import '../theme/app_colors.dart';
import '../utils/app_navigator.dart';
import '../utils/assets.dart';
import '../../features/details/presentation/views/tv_details_view.dart';

class TvCard extends StatelessWidget {
  final Tv tv;
  const TvCard({super.key, required this.tv});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AppNavigator.push(context, TvDetailsView(tv: tv)),
      child: Stack(
        children: [
          Container(
            width: 167,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(8),
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
                //           Assets.baseImageUrl + tv.posterPath!,
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
                      imageUrl: '${Assets.baseImageUrl}${tv.posterPath}',
                      errorWidget: (context, url, error) =>
                          const Center(child: Icon(Icons.error_rounded)),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tv.name!,
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
                  ' ${tv.voteAverage!.toStringAsFixed(1)}',
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
