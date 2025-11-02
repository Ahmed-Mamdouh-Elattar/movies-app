import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/config/app_text_style.dart';
import 'package:movies_app/core/routing/page_name.dart';
import 'package:movies_app/core/widgets/custom_cached_network_image.dart';
import 'package:movies_app/features/search/domain/entities/search_movies_entity.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({required this.movie, super.key});
  final SearchMoviesEntity movie;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(PageName.details, extra: movie.id),
      child: Container(
        padding: const EdgeInsets.all(8),

        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Movie Image
            Expanded(
              child: AspectRatio(
                aspectRatio: 0.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CustomCachedNetworkImage(image: movie.poster ?? ""),
                ),
              ),
            ),
            const SizedBox(width: 12),

            // Movie Info
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    movie.title ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.regular16(context),
                  ),
                  const SizedBox(height: 6),

                  // Rating
                  Row(
                    children: [
                      const Icon(
                        Icons.star_border,
                        color: Colors.orange,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        movie.rating.toString().substring(0, 3),

                        style: AppTextStyle.semiBold12(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  // Year
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.white70,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        movie.releaseDate ?? "",
                        style: AppTextStyle.regular12(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  // Duration
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
