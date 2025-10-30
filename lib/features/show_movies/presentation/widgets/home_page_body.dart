import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/config/app_text_style.dart';
import 'package:movies_app/core/config/app_color.dart';
import 'package:movies_app/core/enums/movie_category_enum.dart';
import 'package:movies_app/features/show_movies/presentation/managers/movies_category_cubit/movies_category_cubit.dart';
import 'package:movies_app/features/show_movies/presentation/managers/random_movies_cubit/random_movies_cubit.dart';
import 'package:movies_app/features/show_movies/presentation/widgets/header_content.dart';
import 'package:movies_app/features/show_movies/presentation/widgets/movies_grid_view_bulider.dart';
import 'package:movies_app/features/show_movies/presentation/widgets/movies_tab_bar.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: RefreshIndicator(
        displacement: 40,
        onRefresh: () async {
          context.read<MoviesCategoryCubit>().reset();
          await context.read<RandomMoviesCubit>().getRandomMovies();
          if (context.mounted) {
            await context.read<MoviesCategoryCubit>().getMoviesByCategory(
              category: MovieCategory.nowPlaying.value,
            );
          }
        },

        child: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              title: Text(
                "What do you want to watch?",
                style: AppTextStyle.semiBold18(context),
              ),
              expandedHeight: 460,
              pinned: true,
              backgroundColor: AppColor.primary,
              flexibleSpace: const FlexibleSpaceBar(
                background: HeaderContent(),
              ),
              bottom: const MoviesTabBar(),
            ),
          ],
          body: const Column(
            children: [
              SizedBox(height: 24),
              Expanded(
                child: TabBarView(
                  children: [
                    MoviesGridViewBuilder(
                      movieCategory: MovieCategory.nowPlaying,
                    ),
                    MoviesGridViewBuilder(
                      movieCategory: MovieCategory.upcoming,
                    ),
                    MoviesGridViewBuilder(
                      movieCategory: MovieCategory.topRated,
                    ),
                    MoviesGridViewBuilder(movieCategory: MovieCategory.popular),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
