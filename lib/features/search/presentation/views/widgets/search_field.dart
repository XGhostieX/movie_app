import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../views_model/search_cubit/search_cubit.dart';
import '../../views_model/search_options_cubit/search_options_cubit.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        context.read<SearchCubit>().search(
          value,
          context.read<SearchOptionsCubit>().state,
        );
      },
      controller: context.read<SearchCubit>().controller,
      decoration: const InputDecoration(hintText: 'Search'),
    );
  }
}
