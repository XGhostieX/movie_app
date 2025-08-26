import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/cubit/generic_cubit.dart';
import '../../../../../core/models/genre.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/widgets/genres_shimmer_skeleton.dart';
import '../../../data/repos/details_repo.dart';

class GenresChip extends StatelessWidget {
  final String endPoint;
  const GenresChip({super.key, required this.endPoint});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericCubit()
        ..fetchData<List<Genre>>(
          getIt.get<DetailsRepo>().fetchGenres(endPoint),
        ),
      child: BlocBuilder<GenericCubit, GenericState>(
        builder: (context, state) {
          if (state is GenericLoading) {
            return const GenresShimmerSkeleton();
          } else if (state is GenericSuccess) {
            return Wrap(
              spacing: 10,
              children: state.data
                  .map<Widget>((Genre e) => Chip(label: Text(e.name!)))
                  .toList(),
            );
            // return Container(
            //   height: 40,
            //   child: ListView.builder(
            //     itemCount: state.data.length,
            //     scrollDirection: Axis.horizontal,
            //     itemBuilder: (context, index) =>
            //         Chip(label: Text(state.data[index].name!)),
            //   ),
            // );
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
