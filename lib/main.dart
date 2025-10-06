import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/config/app_theme.dart';
import 'package:movies_app/core/routing/app_router.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setUpServiceLocator();
  runApp(const MoviesApp());
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
