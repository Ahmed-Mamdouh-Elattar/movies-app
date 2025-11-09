import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/routing/page_name.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/features/watch_list/presentation/managers/watch_list_cubit/watch_list_cubit.dart';
import 'package:movies_app/features/watch_list/presentation/pages/watch_list_page.dart';

final watchListRoute = GoRoute(
  path: PageName.watchList,
  builder: (context, state) => BlocProvider<WatchListCubit>(
    create: (context) => getIt.get<WatchListCubit>(),
    child: const WatchListPage(),
  ),
);
