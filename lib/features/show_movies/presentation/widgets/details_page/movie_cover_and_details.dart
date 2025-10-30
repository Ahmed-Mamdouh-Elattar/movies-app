import 'package:flutter/material.dart';
import 'package:movies_app/features/show_movies/domain/entities/movie_details_entity.dart';
import 'package:movies_app/features/show_movies/presentation/widgets/details_page/movie_back_drop_image.dart';
import 'package:movies_app/features/show_movies/presentation/widgets/details_page/movie_description.dart';
import 'package:movies_app/features/show_movies/presentation/widgets/details_page/movie_poster.dart';
import 'package:movies_app/features/show_movies/presentation/widgets/details_page/movie_title.dart';
import 'package:movies_app/features/show_movies/presentation/widgets/details_page/movie_voting.dart';

class MovieCoverAndDetails extends StatelessWidget {
  const MovieCoverAndDetails({required this.movieDetails, super.key});
  final MovieDetailsEntity? movieDetails;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            MovieBackDropImage(
              movieBackDropImage: movieDetails?.backDrop ?? "",
            ),
            MoviePoster(moviePoster: movieDetails?.poster ?? ""),
            MovieVoting(
              voting: movieDetails?.voting.toString().substring(0, 3) ?? "0.0",
            ),
          ],
        ),
        MoviesTitle(movieTitle: movieDetails?.title ?? ""),
        const SizedBox(height: 40),
        MovieDescription(movieDetails: movieDetails!),
      ],
    );
  }
}
