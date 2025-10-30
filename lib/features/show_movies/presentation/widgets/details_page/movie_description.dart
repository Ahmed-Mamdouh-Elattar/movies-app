import 'package:flutter/material.dart';
import 'package:movies_app/features/show_movies/domain/entities/movie_details_entity.dart';

class MovieDescription extends StatelessWidget {
  const MovieDescription({required this.movieDetails, super.key});
  final MovieDetailsEntity movieDetails;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.calendar_month),
            const SizedBox(width: 4),
            Text(movieDetails.date),
            const SizedBox(width: 12),
            const Text("|"),
            const SizedBox(width: 12),
            const Icon(Icons.timer_outlined),
            const SizedBox(width: 4),
            Text("${movieDetails.duration} Minutes"),
            const SizedBox(width: 12),
          ],
        ),
        const SizedBox(height: 12),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: movieDetails.genres.asMap().entries.map((e) {
            if (e.key == movieDetails.genres.length - 1) {
              return Text(e.value);
            }
            return Text("${e.value}, ");
          }).toList(),
        ),
      ],
    );
  }
}
