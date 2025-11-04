import 'package:flutter/material.dart';
import 'package:movies_app/core/config/app_text_style.dart';
import 'package:movies_app/features/watch_list/domain/entities/movie_watch_list_entity.dart';
import 'package:movies_app/features/watch_list/presentation/widgets/movie_detail_row.dart';
import 'package:movies_app/features/watch_list/presentation/widgets/movie_rating.dart';

class MovieInfo extends StatelessWidget {
  const MovieInfo({required this.movie, super.key});

  final MovieWatchListEntity movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          movie.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.regular16(context),
        ),
        const SizedBox(height: 14),

        // Rating
        MovieRating(voting: movie.voting),
        const SizedBox(height: 6),
        Text(
          movie.genres.join(', '),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.regular12(context),
        ),
        const SizedBox(height: 6),

        // Year
        MovieDetailRow(icon: Icons.calendar_month_outlined, text: movie.date),
        const SizedBox(height: 6),
        MovieDetailRow(
          icon: Icons.watch_later,
          text: "${movie.duration} Minutes",
        ),
      ],
    );
  }
}
