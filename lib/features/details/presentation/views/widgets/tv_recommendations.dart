import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/shimmer_skeleton.dart';
import '../../../../../core/widgets/tv_card.dart';
import '../../views_model/recommendations_tv_cubit/recommendations_tv_cubit.dart';

class TvRecommendations extends StatelessWidget {
  const TvRecommendations({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendationsTvCubit, RecommendationsTvState>(
      builder: (context, state) {
        if (state is RecommendationsTvLoading) {
          return const ShimmerSkeleton();
        } else if (state is RecommendationsTvSuccess) {
          return SizedBox(
            height: 300,
            child: ListView.separated(
              itemCount: state.tv.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) => TvCard(tv: state.tv[index]),
            ),
          );
        } else if (state is RecommendationsTvFailure) {
          return Center(child: Text(state.errMsg));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
