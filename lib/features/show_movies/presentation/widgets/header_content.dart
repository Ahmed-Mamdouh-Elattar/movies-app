import 'package:flutter/material.dart';
import 'package:movies_app/core/helper/constants.dart';
import 'package:movies_app/features/show_movies/presentation/widgets/search_text_field.dart';
import 'package:movies_app/features/show_movies/presentation/widgets/top_movies_list.dart';

class HeaderContent extends StatelessWidget {
  const HeaderContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 60),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kPadding),
          child: SearchTextField(),
        ),
        SizedBox(height: 24),
        Padding(
          padding: EdgeInsets.only(left: kPadding),
          child: SizedBox(height: 210, child: TopMoviesList()),
        ),
      ],
    );
  }
}
