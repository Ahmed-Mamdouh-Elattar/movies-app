import 'package:flutter/material.dart';
import 'package:movies_app/features/show_movies/presentation/widgets/details_page/about_movie_tab.dart';
import 'package:movies_app/features/show_movies/presentation/widgets/details_page/cast_tab_builder.dart';
import 'package:movies_app/features/show_movies/presentation/widgets/details_page/custom_reviews_builder.dart';
import 'package:movies_app/features/show_movies/presentation/widgets/details_page/details_page_movie_tab_bar.dart';
import 'package:movies_app/features/show_movies/presentation/widgets/details_page/movie_cover_and_details_builder.dart';

class DetailsPageBody extends StatelessWidget {
  const DetailsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MovieCoverAndDetailsBuilder(),
          SizedBox(height: 24),
          DetailsPageMovieTabBar(),
          Expanded(
            child: TabBarView(
              children: [
                AboutMovieTab(),
                CustomReviewsBuilder(),
                CastTabBuilder(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
