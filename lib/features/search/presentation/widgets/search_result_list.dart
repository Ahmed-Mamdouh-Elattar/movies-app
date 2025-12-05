import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:movies_app/features/search/domain/entities/search_movies_entity.dart';
import 'package:movies_app/features/search/presentation/managers/search_cubit/search_cubit.dart';
import 'package:movies_app/features/search/presentation/widgets/movie_card.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({required this.movies, super.key});
  final List<SearchMoviesEntity> movies;

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    useEffect(() {
      controller.addListener(() {
        if (controller.position.pixels >=
            controller.position.maxScrollExtent - 400) {
          context.read<SearchCubit>().searchMovies(null);
        }
      });
      return null;
    }, []);
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            controller: controller,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return MovieCard(movie: movies[index]);
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
