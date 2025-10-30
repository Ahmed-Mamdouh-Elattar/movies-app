import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/config/app_text_style.dart';
import 'package:movies_app/core/helper/constants.dart';
import 'package:movies_app/features/show_movies/domain/entities/movie_cast_entity.dart';

class CastTabGridView extends StatelessWidget {
  const CastTabGridView({required this.movieCast, super.key});
  final List<MovieCastEntity> movieCast;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: movieCast.length,
      padding: const EdgeInsets.symmetric(
        horizontal: kPadding - 14,
        vertical: 36,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 120 / 123,
        crossAxisSpacing: 65,
        mainAxisSpacing: 24,
      ),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Expanded(
              child: ClipOval(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: movieCast[index].profilePath,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(movieCast[index].name, style: AppTextStyle.medium12(context)),
          ],
        );
      },
    );
  }
}
