import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/config/app_color.dart';
import 'package:movies_app/core/routing/page_name.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/features/show_movies/presentation/managers/movies_category_cubit/movies_category_cubit.dart';
import 'package:movies_app/features/show_movies/presentation/managers/random_movies_cubit/random_movies_cubit.dart';
import 'package:movies_app/features/show_movies/presentation/pages/details_page.dart';
import 'package:movies_app/features/show_movies/presentation/pages/home_page.dart';

final homeRoute = ShellRoute(
  builder: (context, state, child) {
    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: AppColor.blue)),
        ),
        child: BottomNavigationBar(
          backgroundColor: AppColor.primary,
          currentIndex: 0,
          selectedItemColor: AppColor.blue,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Watch list',
            ),
          ],
        ),
      ),
    );
  },

  routes: [
    GoRoute(
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
    ),
  ],
);
final detailsRoute = GoRoute(
  path: PageName.details,
  builder: (context, state) => const DetailsPage(),
);
