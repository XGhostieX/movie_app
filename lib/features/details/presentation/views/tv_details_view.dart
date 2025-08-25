import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubit/generic_cubit.dart';
import '../../../../core/models/cast.dart';
import '../../../../core/models/genre.dart';
import '../../../../core/models/review/review.dart';
import '../../../../core/models/tv.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../../core/widgets/basic_appbar.dart';
import '../../../home/data/repos/home_repo.dart';
import '../../data/repos/details_repo.dart';
import '../views_model/trailer_cubit/trailer_cubit.dart';
import 'widgets/tv_details_view_body.dart';

class TvDetailsView extends StatelessWidget {
  final Tv tv;
  const TvDetailsView({super.key, required this.tv});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TrailerCubit()..fetchTvTrailer(tv.id!),
        ),
        BlocProvider(
          create: (context) => GenericCubit()
            ..fetchData<List<Genre>>(
              getIt.get<DetailsRepo>().fetchGenres('tv/$tv.id'),
            )
            ..fetchData<List<Cast>>(
              getIt.get<DetailsRepo>().fetchCast('tv/$tv.id/credits'),
            )
            ..fetchData<List<Review>>(
              getIt.get<DetailsRepo>().fetchReviews('tv/$tv.id/reviews'),
            )
            ..fetchData<List<Tv>>(
              getIt.get<HomeRepo>().fetchTv('tv/$tv.id/recommendations'),
            )
            ..fetchData<List<Tv>>(
              getIt.get<HomeRepo>().fetchTv('tv/$tv.id/similar'),
            ),
        ),
      ],
      child: Scaffold(
        appBar: const BasicAppbar(hideBack: false),
        body: TvDetailsViewBody(tv: tv),
      ),
    );
  }
}
