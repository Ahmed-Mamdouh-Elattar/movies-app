import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movies_app/core/enums/movie_category_enum.dart';

import 'package:movies_app/core/networking/network_info/network_cubit/network_cubit.dart';
import 'package:movies_app/features/show_movies/presentation/managers/movies_category_cubit/movies_category_cubit.dart';
import 'package:movies_app/features/show_movies/presentation/widgets/home_page/movie_grid_view.dart';

class MoviesGridViewBuilder extends HookWidget {
  const MoviesGridViewBuilder({required this.movieCategory, super.key});
  final MovieCategory movieCategory;
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read<MoviesCategoryCubit>().reset();
      context.read<MoviesCategoryCubit>().getMoviesByCategory(
        category: movieCategory.value,
      );
      return null;
    }, []);
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
            category: movieCategory.value,
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
