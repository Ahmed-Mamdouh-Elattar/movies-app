import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/custom_cached_network_image.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({required this.moviePoster, super.key});

  final String moviePoster;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Positioned(
      left: 29,
      bottom: -60,
      child: SizedBox(
        width: (95 / width) * width,
        child: AspectRatio(
          aspectRatio: 0.79,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CustomCachedNetworkImage(image: moviePoster),
          ),
        ),
      ),
    );
  }
}
