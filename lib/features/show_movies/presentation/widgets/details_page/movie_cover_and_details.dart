import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/config/app_color.dart';
import 'package:movies_app/core/config/app_text_style.dart';
import 'package:movies_app/features/show_movies/presentation/managers/cubit/movie_details_cubit.dart';
import 'package:movies_app/features/show_movies/presentation/widgets/details_page/movie_description.dart';

class MovieCoverAndDetails extends StatelessWidget {
  const MovieCoverAndDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
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
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            SizedBox(
                              width: width,
                              child: AspectRatio(
                                aspectRatio: 1.8,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    bottom: Radius.circular(16),
                                  ),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: movieDetails?.backDrop ?? "",
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            Center(
                                              child: CircularProgressIndicator(
                                                value:
                                                    downloadProgress.progress,
                                              ),
                                            ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 29,
                              bottom: -60,
                              child: SizedBox(
                                width: (95 / width) * width,
                                child: AspectRatio(
                                  aspectRatio: 0.79,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: CachedNetworkImage(
                                      imageUrl: movieDetails?.poster ?? "",
                                      fit: BoxFit.cover,
                                      progressIndicatorBuilder:
                                          (
                                            context,
                                            url,
                                            downloadProgress,
                                          ) => Center(
                                            child: CircularProgressIndicator(
                                              value: downloadProgress.progress,
                                            ),
                                          ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 9,
                              right: 11,
                              child: ClipPath(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColor.primary.withAlpha(150),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 10,
                                      sigmaY: 10,
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.star_border,
                                          color: AppColor.goldOrange,
                                          size: 24,
                                        ),
                                        const SizedBox(width: 0.5),
                                        Text(
                                          movieDetails?.voting
                                                  .toString()
                                                  .substring(0, 3) ??
                                              "0.0",

                                          style:
                                              AppTextStyle.semiBold12(
                                                context,
                                              ).copyWith(
                                                color: AppColor.goldOrange,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 40 + ((95 / width) * width),
                            ), // to fit with the width of photo to not render over it
                            Expanded(
                              child: Text(
                                movieDetails?.title ?? "",
                                style: AppTextStyle.semiBold18(context),
                              ),
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                        const SizedBox(height: 40),
                        MovieDescription(movieDetails: movieDetails!),
                      ],
                    );
                  },
            ) ??
            const SizedBox();
      },
    );
  }
}
