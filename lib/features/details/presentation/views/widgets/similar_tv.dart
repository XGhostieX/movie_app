import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/cubit/generic_cubit.dart';
import '../../../../../core/widgets/shimmer_skeleton.dart';
import '../../../../../core/widgets/tv_card.dart';

class SimilarTv extends StatelessWidget {
  const SimilarTv({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit, GenericState>(
      builder: (context, state) {
        if (state is GenericLoading) {
          return const ShimmerSkeleton();
        } else if (state is GenericSuccess) {
          return SizedBox(
            height: 300,
            child: ListView.separated(
              itemCount: state.data.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) => TvCard(tv: state.data[index]),
            ),
          );
        } else if (state is GenericFailure) {
          return Center(child: Text(state.errMsg));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
