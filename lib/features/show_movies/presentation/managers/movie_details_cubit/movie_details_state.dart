part of 'movie_details_cubit.dart';

@freezed
abstract class MovieDetailsState with _$MovieDetailsState {
  const factory MovieDetailsState.initial({
    @Default(false) bool isMovieCast,
    @Default(false) bool isMovieReviews,
    @Default(false) bool isMovieDetails,
  }) = Initial;

  const factory MovieDetailsState.loading({
    @Default(false) bool isMovieCast,
    @Default(false) bool isMovieReviews,
    @Default(false) bool isMovieDetails,
  }) = Loading;

  const factory MovieDetailsState.loaded({
    MovieDetailsEntity? movieDetails,
    List<MovieCastEntity>? movieCast,
    List<MovieReviewsEntity>? movieReviews,
    @Default(false) bool isMovieCast,
    @Default(false) bool isMovieReviews,
    @Default(false) bool isMovieDetails,
  }) = Loaded;

  const factory MovieDetailsState.failure({
    required String errMessage,
    @Default(false) bool isMovieCast,
    @Default(false) bool isMovieReviews,
    @Default(false) bool isMovieDetails,
  }) = Failure;
}
