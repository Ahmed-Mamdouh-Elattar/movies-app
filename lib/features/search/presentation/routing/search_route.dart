import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/routing/page_name.dart';
import 'package:movies_app/core/di/service_locator.dart';
import 'package:movies_app/features/search/presentation/managers/search_cubit/search_cubit.dart';
import 'package:movies_app/features/search/presentation/pages/search_page.dart';

final searchRoute = GoRoute(
  path: PageName.search,
  builder: (context, state) => BlocProvider(
    create: (context) => getIt.get<SearchCubit>(),
    child: const SearchPage(),
  ),
);
