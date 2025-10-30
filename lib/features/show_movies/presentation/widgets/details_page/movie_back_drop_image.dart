import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/custom_cached_network_image.dart';

class MovieBackDropImage extends StatelessWidget {
  const MovieBackDropImage({required this.movieBackDropImage, super.key});
  final String movieBackDropImage;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      child: AspectRatio(
        aspectRatio: 1.8,
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
          child: CustomCachedNetworkImage(image: movieBackDropImage),
        ),
      ),
    );
  }
}
