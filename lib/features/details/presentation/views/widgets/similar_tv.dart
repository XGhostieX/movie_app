import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/shimmer_skeleton.dart';
import '../../../../../core/widgets/tv_card.dart';
import '../../views_model/similar_tv_cubit/similar_tv_cubit.dart';

class SimilarTv extends StatelessWidget {
  const SimilarTv({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarTvCubit, SimilarTvState>(
      builder: (context, state) {
        if (state is SimilarTvLoading) {
          return const ShimmerSkeleton();
        } else if (state is SimilarTvSuccess) {
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
        } else if (state is SimilarTvFailure) {
          return Center(child: Text(state.errMsg));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
