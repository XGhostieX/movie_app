import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/tv.dart';
import '../../../../core/widgets/basic_appbar.dart';
import '../views_model/cast_cubit/cast_cubit.dart';
import '../views_model/genres_cubit/genres_cubit.dart';
import '../views_model/recommendations_tv_cubit/recommendations_tv_cubit.dart';
import '../views_model/reviews_cubit/reviews_cubit.dart';
import '../views_model/similar_tv_cubit/similar_tv_cubit.dart';
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
        BlocProvider(create: (context) => GenresCubit()..fetchTvGenres(tv.id!)),
        BlocProvider(create: (context) => CastCubit()..fetchTvCast(tv.id!)),
        BlocProvider(
          create: (context) => ReviewsCubit()..fetchTvReviews(tv.id!),
        ),
        BlocProvider(
          create: (context) =>
              RecommendationsTvCubit()..fetchRecommendationsTv(tv.id!),
        ),
        BlocProvider(
          create: (context) => SimilarTvCubit()..fetchSimilarTv(tv.id!),
        ),
      ],
      child: Scaffold(
        appBar: const BasicAppbar(hideBack: false),
        body: TvDetailsViewBody(tv: tv),
      ),
    );
  }
}
