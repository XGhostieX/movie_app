import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/cubit/generic_cubit.dart';
import '../../../../../core/widgets/genres_shimmer_skeleton.dart';

class GenresChip extends StatelessWidget {
  const GenresChip({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit, GenericState>(
      builder: (context, state) {
        if (state is GenericLoading) {
          return const GenresShimmerSkeleton();
        } else if (state is GenericSuccess) {
          return Wrap(
            spacing: 10,
            children: state.data
                .map((e) => Chip(label: Text(e.name!)))
                .toList(),
          );
          // return Container(
          //   height: 40,
          //   child: ListView.builder(
          //     itemCount: state.keywords.length,
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (context, index) =>
          //         Chip(label: Text(state.keywords[index].name!)),
          //   ),
          // );
        } else if (state is GenericFailure) {
          return Center(child: Text(state.errMsg));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
