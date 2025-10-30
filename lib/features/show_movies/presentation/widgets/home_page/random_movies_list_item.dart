import 'package:flutter/material.dart';
import 'package:movies_app/core/helper/assets.dart';
import 'package:movies_app/core/widgets/custom_cached_network_image.dart';
import 'package:movies_app/features/show_movies/domain/entities/movies_entity.dart';

class RandomMoviesListItem extends StatelessWidget {
  const RandomMoviesListItem({required this.movie, super.key});

  final MoviesEntity? movie;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 144.61 / 210,
        child: movie == null
            ? Image.asset(
                Assets.iconsPopcorn,
                fit: BoxFit.cover,
              ) // Skeletonizer هيبني placeholder تلقائي
            : CustomCachedNetworkImage(image: movie!.poster),
      ),
    );
  }
}
