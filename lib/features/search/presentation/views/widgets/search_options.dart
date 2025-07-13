import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../views_model/search_cubit/search_cubit.dart';
import '../../views_model/search_options_cubit/search_options_cubit.dart';
import 'select_option.dart';

class SearchOptions extends StatelessWidget {
  const SearchOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchOptionsCubit, SearchType>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SelectOption(
              title: 'Movie',
              isSelected:
                  context.read<SearchOptionsCubit>().state == SearchType.movie,
              onTap: () {
                context.read<SearchOptionsCubit>().selectMovie();
                context.read<SearchCubit>().search(
                  context.read<SearchCubit>().controller.text,
                  context.read<SearchOptionsCubit>().state,
                );
              },
            ),
            SelectOption(
              title: 'TV',
              isSelected:
                  context.read<SearchOptionsCubit>().state == SearchType.tv,
              onTap: () {
                context.read<SearchOptionsCubit>().selectTv();
                context.read<SearchCubit>().search(
                  context.read<SearchCubit>().controller.text,
                  context.read<SearchOptionsCubit>().state,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
