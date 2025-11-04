import 'package:flutter/material.dart';
import 'package:movies_app/features/show_movies/presentation/widgets/details_page/details_page_body.dart';
import 'package:movies_app/features/watch_list/presentation/widgets/watch_list_icon.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({required this.movieId, super.key});
  final int movieId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        actions: [WatchListIcon(id: movieId)],
      ),
      body: const SafeArea(child: DetailsPageBody()),
    );
  }
}
