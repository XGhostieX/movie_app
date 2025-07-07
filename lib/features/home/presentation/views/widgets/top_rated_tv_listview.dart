import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../views_model/top_rated_tv_cubit/top_rated_tv_cubit.dart';
import 'tv_card.dart';

class TopRatedTvListview extends StatelessWidget {
  const TopRatedTvListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedTvCubit, TopRatedTvState>(
      builder: (context, state) {
        if (state is TopRatedTvLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TopRatedTvSuccess) {
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
        } else if (state is TopRatedTvFailure) {
          return Center(child: Text(state.errMsg));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
