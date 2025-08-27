import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/utils/assets.dart';

import '../../../../../core/cubit/generic_cubit.dart';
import '../../../../../core/models/review/review.dart';
import '../../../../../core/utils/api_config.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../data/repos/details_repo.dart';

class ReviewsListview extends StatelessWidget {
  final String endPoint;
  const ReviewsListview({super.key, required this.endPoint});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericCubit()
        ..fetchData<List<Review>>(
          getIt.get<DetailsRepo>().fetchReviews('$endPoint/reviews'),
        ),
      child: BlocBuilder<GenericCubit, GenericState>(
        builder: (context, state) {
          if (state is GenericLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GenericSuccess) {
            return SizedBox(
              height: 250,
              child: ListView.separated(
                itemCount: state.data.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: AppColors.secondBackground,

                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CachedNetworkImage(
                                imageUrl:
                                    '${ApiConfig.baseImageUrl}${state.data[index].authorDetails?.avatarPath}',
                                imageBuilder: (context, imageProvider) =>
                                    CircleAvatar(
                                      backgroundImage: imageProvider,
                                    ),
                                errorWidget: (context, url, error) =>
                                    CircleAvatar(
                                      child: Image.asset(Assets.profile),
                                    ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                state.data[index].author!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 20,
                                color: Colors.amber,
                              ),
                              Text(
                                '${state.data[index].authorDetails?.rating ?? 'No Rating'} ',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  // overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        state.data[index].content!,
                        maxLines: 9,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
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
