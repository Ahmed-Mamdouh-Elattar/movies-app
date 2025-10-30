import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/show_movies/presentation/managers/cubit/movie_details_cubit.dart';
import 'package:movies_app/features/show_movies/presentation/widgets/details_page/cast_tab_grid_view.dart';

class CastTabBuilder extends StatefulWidget {
  const CastTabBuilder({super.key});

  @override
  State<CastTabBuilder> createState() => _CastTabBuilderState();
}

class _CastTabBuilderState extends State<CastTabBuilder> {
  @override
  void initState() {
    context.read<MovieDetailsCubit>().getMovieCast();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      buildWhen: (previous, current) {
        if (current.isMovieCast) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        return state.whenOrNull(
              loading: (isMovieCast, isMovieReviews, isMovieDetails) {
                return const Center(child: CircularProgressIndicator());
              },
              failure:
                  (errMessage, isMovieCast, isMovieReviews, isMovieDetails) {
                    return Text(errMessage);
                  },

              loaded:
                  (
                    movieDetails,
                    movieCast,
                    movieReviews,
                    isMovieCast,
                    isMovieReviews,
                    isMovieDetails,
                  ) {
                    return CastTabGridView(movieCast: movieCast!);
                  },
            ) ??
            const SizedBox();
      },
    );
  }
}
