import 'package:flutter/material.dart';

import 'category_title.dart';
import 'popular_movies_listview.dart';
import 'popular_tv_listview.dart';
import 'top_rated_movies_listview.dart';
import 'top_rated_tv_listview.dart';
import 'trending_movies.dart';
import 'upcoming_movies_listview.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryTitle(title: 'Trending 🔥'),
          TrendingMovies(),
          SizedBox(height: 15),
          CategoryTitle(title: 'Popular Movies'),
          SizedBox(height: 15),
          PopularMoviesListview(),
          CategoryTitle(title: 'Top-Rated Movies'),
          SizedBox(height: 15),
          TopRatedMoviesListview(),
          CategoryTitle(title: 'Popular TV-Shows'),
          SizedBox(height: 15),
          PopularTvListview(),
          CategoryTitle(title: 'Top-Rated TV-Shows'),
          SizedBox(height: 15),
          TopRatedTvListview(),
          CategoryTitle(title: 'Upcoming Movies'),
          SizedBox(height: 15),
          UpcomingMoviesListview(),
        ],
      ),
    );
  }
}
