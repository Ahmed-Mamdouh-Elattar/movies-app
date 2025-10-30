import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/config/app_color.dart';
import 'package:movies_app/core/config/app_text_style.dart';
import 'package:movies_app/core/helper/custom_cash_manager.dart';
import 'package:movies_app/features/show_movies/domain/entities/movie_reviews_entity.dart';

class CustomReview extends StatelessWidget {
  const CustomReview({required this.movieReviews, super.key});
  final MovieReviewsEntity movieReviews;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: movieReviews.avatar,
                    cacheManager: customCacheManager,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                          child: CircularProgressIndicator(
                            value: downloadProgress.progress,
                          ),
                        ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                movieReviews.rating.toString(),
                style: AppTextStyle.medium12(
                  context,
                ).copyWith(color: AppColor.blue),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(movieReviews.author, style: AppTextStyle.medium12(context)),
              const SizedBox(height: 8),
              Text(
                movieReviews.content,
                style: AppTextStyle.regular12(context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
