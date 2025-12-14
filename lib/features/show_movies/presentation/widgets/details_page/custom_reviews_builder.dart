import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movies_app/features/show_movies/presentation/managers/movie_details_cubit/movie_details_cubit.dart';
import 'package:movies_app/features/show_movies/presentation/widgets/details_page/custom_review.dart';

class CustomReviewsBuilder extends HookWidget {
  const CustomReviewsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read<MovieDetailsCubit>().getMovieReviews(
        movieDetails: context.read<MovieDetailsCubit>().movieDetails,
      );
      return null;
    }, []);
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      buildWhen: (previous, current) {
        if (current.isMovieReviews) {
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
                    if (movieReviews == null || movieReviews.isEmpty) {
                      return const Center(child: Text("No Reviews Yet"));
                    }
                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 29,
                        vertical: 32,
                      ),
                      itemBuilder: (context, index) {
                        return CustomReview(movieReviews: movieReviews[index]);
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 24),
                      itemCount: movieReviews.length,
                    );
                  },
            ) ??
            const SizedBox();
      },
    );
  }
}
