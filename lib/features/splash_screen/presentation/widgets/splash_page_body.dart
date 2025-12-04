import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:movies_app/core/routing/page_name.dart';
import 'package:movies_app/features/auth/presentation/managers/auth_cubit/auth_cubit.dart';
import 'package:movies_app/features/splash_screen/managers/cubit/splash_cubit.dart';
import 'package:movies_app/features/splash_screen/presentation/widgets/splash_page_body_content.dart';

class SplashPageBody extends StatelessWidget {
  const SplashPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SplashCubit, bool>(
          listener: (context, state) {
            if (state) {
              context.read<AuthCubit>().getAuthState();
            }
          },
        ),
        BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            state.whenOrNull(
              authenticated: (user) => context.go(PageName.home),
              unauthenticated: () => context.go(PageName.login),
            );
          },
        ),
      ],
      child: const SplashPageBodyContent(),
    );
  }
}
