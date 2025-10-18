import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/routing/page_name.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/features/splash_screen/managers/cubit/splash_cubit.dart';
import 'package:movies_app/features/splash_screen/presentation/pages/splash_page.dart';

final splashRouter = GoRoute(
  path: PageName.splash,
  builder: (context, state) => BlocProvider(
    create: (context) => getIt.get<SplashCubit>(),
    child: const SplashPage(),
  ),
);
