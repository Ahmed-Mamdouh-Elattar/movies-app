import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app/features/show_movies/presentation/managers/movies_cubit/movies_cubit.dart';
import 'package:movies_app/features/show_movies/presentation/widgets/top_movies_list.dart';

class TopMoviesListBuilder extends StatelessWidget {
  const TopMoviesListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      buildWhen: (previous, current) {
        if (current is LoadingMore) {
          return false;
        }
        return true;
      },
      builder: (context, state) {
        if (state is Loading) {
          return const TopMoviesList(movies: [], isLoading: true);
        }
        if (state is Loaded) {
          return TopMoviesList(movies: state.movies, isLoading: false);
        }
        if (state is Failure) {
          return Center(child: Text(state.errMessage));
        }
        return const SizedBox();
      },
    );
  }
}
