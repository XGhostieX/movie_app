import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/basic_appbar.dart';
import '../views_model/popular_movies_cubit/popular_movies_cubit.dart';
import '../views_model/popular_tv_cubit/popular_tv_cubit.dart';
import '../views_model/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import '../views_model/top_rated_tv_cubit/top_rated_tv_cubit.dart';
import '../views_model/trending_movies_cubit/trending_movies_cubit.dart';
import '../views_model/upcoming_movies_cubit/upcoming_movies_cubit.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PopularMoviesCubit()..fetchPopularMovies(),
        ),
        BlocProvider(create: (context) => PopularTvCubit()..fetchPopularTv()),
        BlocProvider(
          create: (context) => TopRatedMoviesCubit()..fetchTopRatedMovies(),
        ),
        BlocProvider(create: (context) => TopRatedTvCubit()..fetchTopRatedTv()),
        BlocProvider(
          create: (context) => TrendingMoviesCubit()..fetchTrendingMovies(),
        ),
        BlocProvider(
          create: (context) => UpcomingMoviesCubit()..fetchUpcomingMovies(),
        ),
      ],
      child: Scaffold(
        appBar: BasicAppbar(
          hideBack: true,
          title: SvgPicture.asset(Assets.logo),
        ),
        body: const HomeViewBody(),
      ),
    );
  }
}
