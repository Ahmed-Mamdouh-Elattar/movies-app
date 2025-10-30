import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/helper/constants.dart';
import 'package:movies_app/core/routing/page_name.dart';
import 'package:movies_app/features/show_movies/domain/entities/movies_entity.dart';
import 'package:movies_app/features/show_movies/presentation/managers/random_movies_cubit/random_movies_cubit.dart';
import 'package:movies_app/features/show_movies/presentation/widgets/home_page/random_movies_list_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RandomMoviesList extends StatefulWidget {
  const RandomMoviesList({
    required this.movies,
    required this.isLoading,
    super.key,
  });

  final List<MoviesEntity> movies;
  final bool isLoading;

  @override
  State<RandomMoviesList> createState() => _RandomMoviesListState();
}

class _RandomMoviesListState extends State<RandomMoviesList> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200) {
        context.read<RandomMoviesCubit>().getRandomMovies();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: widget.isLoading,

      child: Row(
        children: [
          Expanded(
            child: ListView.separated(
              controller: scrollController,
              separatorBuilder: (context, index) =>
                  const SizedBox(width: kPadding),
              scrollDirection: Axis.horizontal,
              itemCount: widget.isLoading ? 5 : widget.movies.length,
              itemBuilder: (context, index) {
                final movie = widget.isLoading ? null : widget.movies[index];

                return InkWell(
                  onTap: widget.isLoading
                      ? null
                      : () => context.push(
                          PageName.details,
                          extra: movie?.id ?? 0,
                        ),
                  child: RandomMoviesListItem(movie: movie),
                );
              },
            ),
          ),
          BlocBuilder<RandomMoviesCubit, RandomMoviesState>(
            builder: (context, state) {
              if (state is LoadingMore) {
                return const Row(
                  children: [
                    SizedBox(width: 10),
                    Center(child: CircularProgressIndicator()),
                  ],
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
