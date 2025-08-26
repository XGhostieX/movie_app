import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/tv.dart';
import '../../../../core/widgets/basic_appbar.dart';
import '../views_model/trailer_cubit/trailer_cubit.dart';
import 'widgets/tv_details_view_body.dart';

class TvDetailsView extends StatelessWidget {
  final Tv tv;
  const TvDetailsView({super.key, required this.tv});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrailerCubit()..fetchTvTrailer(tv.id!),
      child: Scaffold(
        appBar: const BasicAppbar(hideBack: false),
        body: TvDetailsViewBody(tv: tv, endPoint: 'tv/${tv.id}'),
      ),
    );
  }
}
