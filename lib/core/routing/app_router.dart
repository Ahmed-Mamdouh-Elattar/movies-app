import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/routing/page_name.dart';

import 'package:movies_app/features/auth/presentation/managers/auth_cubit/auth_cubit.dart';

import 'package:movies_app/features/auth/presentation/routing/auth_route.dart';

import 'package:movies_app/features/splash_screen/presentation/routing/splash_router.dart';

final appRouter = GoRouter(
  initialLocation: PageName.splash,
  redirect: (context, state) {
    final authCubit = context.read<AuthCubit>();

    if (authCubit.state is Authenticated) {
      return PageName.home;
    } else if (authCubit.state is Unauthenticated) {
      return PageName.login;
    }
    return null;
  },
  routes: [splashRouter, authRouter],
);
