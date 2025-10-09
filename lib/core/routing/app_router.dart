import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/routing/page_name.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:movies_app/features/auth/presentation/pages/login_page.dart';
import 'package:movies_app/features/auth/presentation/pages/phone_auth_page.dart';
import 'package:movies_app/features/auth/presentation/pages/otp_verification_page.dart';
import 'package:movies_app/features/auth/presentation/pages/register_page.dart';
import 'package:movies_app/features/splash_screen/presentation/pages/splash_page.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: PageName.splash,
      builder: (context, state) => const SplashPage(),
    ),
    ShellRoute(
      builder: (context, state, child) =>
          BlocProvider(create: (context) => getIt<AuthCubit>(), child: child),
      routes: [
        GoRoute(
          path: PageName.login,
          builder: (context, state) => const LoginPage(),
          routes: [
            GoRoute(
              path: 'register',
              builder: (context, state) => const RegisterPage(),
            ),
            GoRoute(
              path: 'phone-auth',
              builder: (context, state) => const PhoneAuthPage(),
              routes: [
                GoRoute(
                  path: 'otp-verification',
                  builder: (context, state) => const OtpVerificationPage(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
