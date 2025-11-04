import 'package:flutter/material.dart';
import 'package:movies_app/core/helper/constants.dart';
import 'package:movies_app/core/widgets/custom_cached_network_image.dart';
import 'package:movies_app/features/watch_list/domain/entities/movie_watch_list_entity.dart';
import 'package:movies_app/features/watch_list/presentation/widgets/movie_info.dart';

class WatchListMovieItem extends StatelessWidget {
  const WatchListMovieItem({required this.movie, super.key});
  final MovieWatchListEntity movie;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kPadding, vertical: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Movie Image
          Expanded(
            child: AspectRatio(
              aspectRatio: 0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CustomCachedNetworkImage(image: movie.poster),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Movie Info
          Expanded(flex: 2, child: MovieInfo(movie: movie)),
        ],
      ),
    );
  }
}
