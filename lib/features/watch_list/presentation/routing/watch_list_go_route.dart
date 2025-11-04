import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/routing/page_name.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/features/show_movies/presentation/routing/home_route.dart';
import 'package:movies_app/features/watch_list/presentation/managers/cubit/watch_list_cubit.dart';
import 'package:movies_app/features/watch_list/presentation/pages/watch_list_page.dart';

final watchListRoute = GoRoute(
  path: PageName.watchList,
  pageBuilder: (context, state) => CustomTransitionPage(
    key: state.pageKey,
    child: const WatchListPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
  ),
);
final watchListAndHomeShellRoute = ShellRoute(
  builder: (context, state, child) => BlocProvider<WatchListCubit>(
    child: child,
    create: (context) => getIt.get<WatchListCubit>(),
  ),
  routes: [homeRoute, detailsRoute, watchListRoute],
);
