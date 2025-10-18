import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/config/app_theme.dart';
import 'package:movies_app/core/routing/app_router.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/features/auth/presentation/managers/auth_cubit/auth_cubit.dart';
import 'package:movies_app/firebase_options.dart';
import 'package:movies_app/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = SimpleBlocObserver();
  setUpServiceLocator();
  runApp(
    BlocProvider(
      create: (context) => getIt.get<AuthCubit>(),
      child: const MoviesApp(),
    ),
  );
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      theme: AppTheme.appTheme(context),
      debugShowCheckedModeBanner: false,
    );
  }
}
