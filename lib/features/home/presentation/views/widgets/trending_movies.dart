import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/api_url.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/widgets/carousel_shimmer_skeleton.dart';
import '../../../data/repos/home_repo.dart';
import '../../views_model/trending_movies_cubit/trending_movies_cubit.dart';

class TrendingMovies extends StatefulWidget {
  const TrendingMovies({super.key});

  @override
  State<TrendingMovies> createState() => _TrendingMoviesState();
}

class _TrendingMoviesState extends State<TrendingMovies> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TrendingMoviesCubit(getIt.get<HomeRepo>())..fetchTrendingMovies(),
      child: BlocBuilder<TrendingMoviesCubit, TrendingMoviesState>(
        builder: (context, state) {
          if (state is TrendingMoviesLoading) {
            return const CarouselShimmerSkeleton();
          } else if (state is TrendingMoviesSuccess) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CarouselSlider(
                  items: state.movies
                      .map(
                        (movie) => GestureDetector(
                          onTap: () => GoRouter.of(
                            context,
                          ).push(AppRouter.kMovieDetailsView, extra: movie),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: CachedNetworkImage(
                              // height: 100,
                              // width: 100,
                              imageUrl:
                                  '${ApiUrl.baseImageUrl}${movie.posterPath}',
                              errorWidget: (context, url, error) =>
                                  const Center(
                                    child: Icon(Icons.error_rounded),
                                  ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  carouselController: _controller,
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.38,
                    // aspectRatio: 16/9,
                    viewportFraction: 0.6,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: state.movies.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        margin: const EdgeInsets.only(
                          top: 10,
                          right: 4.5,
                          left: 4.5,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == entry.key
                              ? AppColors.primary
                              : Colors.white.withValues(alpha: 0.5),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            );
          } else if (state is TrendingMoviesFailure) {
            return Center(child: Text(state.errMsg));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
