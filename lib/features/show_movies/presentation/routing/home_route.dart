import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/config/app_color.dart';
import 'package:movies_app/core/routing/page_name.dart';
import 'package:movies_app/features/show_movies/presentation/pages/home_page.dart';

final homeRoute = ShellRoute(
  builder: (context, state, child) {
    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: AppColor.blue)),
        ),
        child: BottomNavigationBar(
          backgroundColor: AppColor.primary,
          currentIndex: 0,
          selectedItemColor: AppColor.blue,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Watch list',
            ),
          ],
        ),
      ),
    );
  },

  routes: [
    GoRoute(path: PageName.home, builder: (context, state) => const HomePage()),
  ],
);
