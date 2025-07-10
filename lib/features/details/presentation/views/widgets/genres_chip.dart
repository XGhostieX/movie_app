import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../views_model/genres_cubit/genres_cubit.dart';

class GenresChip extends StatelessWidget {
  const GenresChip({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenresCubit, GenresState>(
      builder: (context, state) {
        if (state is GenresLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GenresSuccess) {
          return Wrap(
            spacing: 10,
            children: state.genres
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
        } else if (state is GenresFailure) {
          return Center(child: Text(state.errMsg));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
