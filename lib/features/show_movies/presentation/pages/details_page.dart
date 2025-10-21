import 'package:flutter/material.dart';
import 'package:movies_app/features/show_movies/presentation/widgets/details_page/details_page_body.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: DetailsPageBody()));
  }
}
