import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/config/app_color.dart';
import 'package:movies_app/core/routing/page_name.dart';
import 'package:movies_app/core/di/service_locator.dart';
import 'package:movies_app/features/ai_chat/presentation/routing/ai_chat_route.dart';
import 'package:movies_app/features/show_movies/presentation/managers/movie_details_cubit/movie_details_cubit.dart';
import 'package:movies_app/features/show_movies/presentation/managers/movies_category_cubit/movies_category_cubit.dart';
import 'package:movies_app/features/show_movies/presentation/managers/random_movies_cubit/random_movies_cubit.dart';
import 'package:movies_app/features/show_movies/presentation/pages/details_page.dart';
import 'package:movies_app/features/show_movies/presentation/pages/home_page.dart';
import 'package:movies_app/features/watch_list/presentation/routing/watch_list_go_route.dart';

final homeShellRoute = ShellRoute(
  builder: (context, state, child) {
    return Scaffold(
      body: SafeArea(child: child),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: AppColor.blue)),
        ),
        child: BottomNavigationBar(
          onTap: (value) {
            switch (value) {
              case 0:
                context.go(PageName.home);
                break;
              case 1:
                context.go(PageName.watchList);
                break;
              case 2:
                context.go(PageName.aiChat);
                break;
            }
          },
          backgroundColor: AppColor.primary,
          currentIndex: _calculateSelectedIndex(state),

          selectedItemColor: AppColor.blue,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Watch list',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'AI Chat'),
          ],
        ),
      ),
    );
  },

  routes: [homeRoute, watchListRoute, aiChatRoute],
);

final homeRoute = GoRoute(
  path: PageName.home,
  builder: (context, state) => MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => getIt<MoviesCategoryCubit>()),
      BlocProvider(
        create: (context) => getIt<RandomMoviesCubit>()..getRandomMovies(),
      ),
    ],
    child: const HomePage(),
  ),
);

final detailsRoute = GoRoute(
  path: PageName.details,
  builder: (context, state) => BlocProvider(
    create: (context) =>
        getIt<MovieDetailsCubit>()
          ..getMovieDetails(movieId: state.extra as int),
    child: DetailsPage(movieId: state.extra as int),
  ),
);
int _calculateSelectedIndex(GoRouterState state) {
  String location = state.fullPath ?? "";
  if (location == (PageName.home)) {
    return 0;
  }
  if (location == (PageName.watchList)) {
    return 1;
  }
  if (location == (PageName.aiChat)) {
    return 2;
  }
  return 0;
}
