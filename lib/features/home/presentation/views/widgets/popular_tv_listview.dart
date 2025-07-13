import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/shimmer_skeleton.dart';
import '../../views_model/popular_tv_cubit/popular_tv_cubit.dart';
import '../../../../../core/widgets/tv_card.dart';

class PopularTvListview extends StatelessWidget {
  const PopularTvListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularTvCubit, PopularTvState>(
      builder: (context, state) {
        if (state is PopularTvLoading) {
          return const ShimmerSkeleton();
        } else if (state is PopularTvSuccess) {
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
        } else if (state is PopularTvFailure) {
          return Center(child: Text(state.errMsg));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
