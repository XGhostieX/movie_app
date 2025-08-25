import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/cubit/generic_cubit.dart';
import '../../../../core/models/movie.dart';
import '../../../../core/models/tv.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../../core/widgets/basic_appbar.dart';
import '../../data/repos/home_repo.dart';
import '../views_model/trending_movies_cubit/trending_movies_cubit.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TrendingMoviesCubit()..fetchTrendingMovies(),
        ),
        BlocProvider(
          create: (context) => GenericCubit()
            ..fetchData<List<Movie>>(
              getIt.get<HomeRepo>().fetchMovies(Assets.popularMovies),
            )
            ..fetchData<List<Movie>>(
              getIt.get<HomeRepo>().fetchMovies(Assets.topRatedMovies),
            )
            ..fetchData<List<Tv>>(
              getIt.get<HomeRepo>().fetchTv(Assets.popularTv),
            )
            ..fetchData<List<Tv>>(
              getIt.get<HomeRepo>().fetchTv(Assets.topRatedTv),
            )
            ..fetchData<List<Movie>>(
              getIt.get<HomeRepo>().fetchMovies(Assets.upcomingMovies),
            ),
        ),
      ],
      child: Scaffold(
        appBar: BasicAppbar(
          hideBack: true,
          title: SvgPicture.asset(Assets.logo),
          action: IconButton(
            onPressed: () => GoRouter.of(context).push(AppRouter.kSearchView),
            icon: const Icon(Icons.search_rounded),
          ),
        ),
        body: const HomeViewBody(),
      ),
    );
  }
}
