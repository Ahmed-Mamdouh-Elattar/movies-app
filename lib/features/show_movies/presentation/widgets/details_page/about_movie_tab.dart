import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/config/app_text_style.dart';
import 'package:movies_app/features/show_movies/presentation/managers/cubit/movie_details_cubit.dart';

class AboutMovieTab extends StatelessWidget {
  const AboutMovieTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 32),
      child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        buildWhen: (previous, current) {
          if (current.isMovieDetails) {
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
                      return Text(
                        movieDetails?.overview ?? "",
                        style: AppTextStyle.regular12(context),
                      );
                    },
              ) ??
              const SizedBox();
        },
      ),
    );
  }
}
