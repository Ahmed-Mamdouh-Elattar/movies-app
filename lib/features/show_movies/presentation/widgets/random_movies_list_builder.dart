import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/networking/network_info/network_cubit/network_cubit.dart';

import 'package:movies_app/features/show_movies/presentation/managers/random_movies_cubit/random_movies_cubit.dart';
import 'package:movies_app/features/show_movies/presentation/widgets/random_movies_list.dart';

class RandomMoviesListBuilder extends StatelessWidget {
  const RandomMoviesListBuilder({super.key});

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
          context.read<RandomMoviesCubit>().getRandomMovies();
        }
      },
      child: BlocBuilder<RandomMoviesCubit, RandomMoviesState>(
        buildWhen: (previous, current) {
          if (current is LoadingMore) {
            return false;
          }
          return true;
        },
        builder: (context, state) {
          return state.whenOrNull(
                loading: () =>
                    const RandomMoviesList(movies: [], isLoading: true),
                loaded: (movies) =>
                    RandomMoviesList(movies: movies, isLoading: false),
                failure: (errMessage) => Center(child: Text(errMessage)),
              ) ??
              const SizedBox();
        },
      ),
    );
  }
}
