import 'package:flutter/material.dart';
import 'package:movies_app/features/show_movies/presentation/widgets/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: HomePageBody());
  }
}
// 'https://picsum.photos/seed/${key}_$index/200/300',