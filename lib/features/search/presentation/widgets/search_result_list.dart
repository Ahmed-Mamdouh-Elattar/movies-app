import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app/features/search/domain/entities/search_movies_entity.dart';
import 'package:movies_app/features/search/presentation/managers/search_cubit/search_cubit.dart';
import 'package:movies_app/features/search/presentation/widgets/movie_card.dart';

class SearchResultList extends StatefulWidget {
  const SearchResultList({required this.movies, super.key});
  final List<SearchMoviesEntity> movies;

  @override
  State<SearchResultList> createState() => _SearchResultListState();
}

class _SearchResultListState extends State<SearchResultList> {
  late ScrollController controller = ScrollController();
  @override
  void initState() {
    controller.addListener(() {
      if (controller.position.pixels >=
          controller.position.maxScrollExtent - 400) {
        context.read<SearchCubit>().searchMovies(null);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            controller: controller,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemCount: widget.movies.length,
            itemBuilder: (context, index) {
              return MovieCard(movie: widget.movies[index]);
            },
          ),
        ),
        BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const SizedBox(),
              loadingMore: () {
                return const Column(
                  children: [
                    SizedBox(height: 12),
                    Center(child: CircularProgressIndicator()),
                    SizedBox(height: 8),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }
}
