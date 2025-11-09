import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/features/search/presentation/routing/search_route.dart';
import 'package:movies_app/features/show_movies/presentation/routing/home_route.dart';
import 'package:movies_app/features/watch_list/presentation/managers/watch_list_notifier/watch_list_notifier_cubit.dart';

final homeDetailsSearchShellRoute = ShellRoute(
  builder: (context, state, child) => BlocProvider(
    create: (context) => getIt.get<WatchListNotifierCubit>(),
    child: child,
  ),
  routes: [homeShellRoute, detailsRoute, searchRoute],
);
