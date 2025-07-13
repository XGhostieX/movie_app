import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/basic_appbar.dart';
import '../views_model/search_cubit/search_cubit.dart';
import '../views_model/search_options_cubit/search_options_cubit.dart';
import 'widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SearchOptionsCubit()),
        BlocProvider(create: (context) => SearchCubit()),
      ],
      child: Scaffold(
        appBar: BasicAppbar(
          height: 80,
          hideBack: false,
          title: SvgPicture.asset(Assets.logo),
          action: const Padding(
            padding: EdgeInsets.only(right: 16),
            child: Text(
              'Search',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: const SearchViewBody(),
      ),
    );
  }
}
