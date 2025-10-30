import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/enums/movie_category_enum.dart';
import 'package:movies_app/core/helper/assets.dart';
import 'package:movies_app/core/helper/constants.dart';
import 'package:movies_app/core/helper/custom_cash_manager.dart';
import 'package:movies_app/core/routing/page_name.dart';
import 'package:movies_app/features/show_movies/domain/entities/movies_entity.dart';
import 'package:movies_app/features/show_movies/presentation/managers/movies_category_cubit/movies_category_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MoviesGridView extends StatelessWidget {
  const MoviesGridView({
    required this.movies,

    super.key,
    this.isLoading = false,
  });
  final List<MoviesEntity> movies;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification.metrics.pixels >=
            scrollNotification.metrics.maxScrollExtent - 200) {
          context.read<MoviesCategoryCubit>().getMoviesByCategory(
            category: MovieCategory.nowPlaying.value,
          );
        }
        return false;
      },
      child: Skeletonizer(
        enabled: isLoading,
        child: GridView.builder(
          itemCount: isLoading ? 9 : movies.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: kPadding),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.55,
            crossAxisCount: 3,
            crossAxisSpacing: 13,
            mainAxisSpacing: 19,
          ),
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: isLoading
                  ? Image.asset(Assets.iconsPopcorn, fit: BoxFit.cover)
                  : InkWell(
                      onTap: () {
                        context.push(PageName.details, extra: movies[index].id);
                      },
                      child: CachedNetworkImage(
                        cacheManager: customCacheManager,
                        height: 250,
                        fit: BoxFit.cover,
                        imageUrl: movies[index].poster,
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
            );
          },
        ),
      ),
    );
  }
}
