import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/enums/movie_category_enum.dart';
import 'package:movies_app/core/helper/assets.dart';
import 'package:movies_app/core/helper/constants.dart';
import 'package:movies_app/core/helper/custom_cash_manager.dart';
import 'package:movies_app/core/networking/network_info/network_cubit/network_cubit.dart';
import 'package:movies_app/features/show_movies/domain/entities/movies_entity.dart';
import 'package:movies_app/features/show_movies/presentation/managers/movies_category_cubit/movies_category_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MoviesGridViewBuilder extends StatefulWidget {
  const MoviesGridViewBuilder({required this.movieCategory, super.key});
  final MovieCategory movieCategory;

  @override
  State<MoviesGridViewBuilder> createState() => _MoviesGridViewBuilderState();
}

class _MoviesGridViewBuilderState extends State<MoviesGridViewBuilder> {
  @override
  void initState() {
    context.read<MoviesCategoryCubit>().reset();
    context.read<MoviesCategoryCubit>().getMoviesByCategory(
      category: widget.movieCategory.value,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkCubit, NetworkState>(
      listenWhen: (previous, current) {
        if (previous is NetworkDisconnected && current is NetWorkConnected) {
          return true;
        } else {
          return false;
        }
      },
      listener: (context, state) {
        if (state is NetWorkConnected) {
          context.read<MoviesCategoryCubit>().getMoviesByCategory(
            category: widget.movieCategory.value,
          );
        }
      },
      child: BlocBuilder<MoviesCategoryCubit, MoviesCategoryState>(
        buildWhen: (previous, current) {
          if (current is LoadingMore) {
            return false;
          }
          return true;
        },
        builder: (context, state) {
          return state.mapOrNull(
                loading: (value) =>
                    const MoviesGridView(isLoading: true, movies: []),
                loaded: (data) =>
                    MoviesGridView(movies: data.movies, isLoading: false),
                failure: (value) => Center(child: Text(value.errMessage)),
              ) ??
              const SizedBox();
        },
      ),
    );
  }
}

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
                  : CachedNetworkImage(
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
            );
          },
        ),
      ),
    );
  }
}
