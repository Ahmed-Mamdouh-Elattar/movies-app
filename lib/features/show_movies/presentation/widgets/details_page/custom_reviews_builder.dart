import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/show_movies/presentation/managers/cubit/movie_details_cubit.dart';
import 'package:movies_app/features/show_movies/presentation/widgets/details_page/custom_review.dart';

class CustomReviewsBuilder extends StatefulWidget {
  const CustomReviewsBuilder({super.key});

  @override
  State<CustomReviewsBuilder> createState() => _CustomReviewsBuilderState();
}

class _CustomReviewsBuilderState extends State<CustomReviewsBuilder> {
  @override
  void initState() {
    context.read<MovieDetailsCubit>().getMovieReviews();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
