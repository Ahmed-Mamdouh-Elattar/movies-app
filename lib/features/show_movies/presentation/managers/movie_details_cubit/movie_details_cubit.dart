import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/core/utils/response_result.dart';
import 'package:movies_app/core/utils/safe_emit_extension.dart';
import 'package:movies_app/features/show_movies/domain/entities/movie_cast_entity.dart';
import 'package:movies_app/features/show_movies/domain/entities/movie_details_entity.dart';
import 'package:movies_app/features/show_movies/domain/entities/movie_reviews_entity.dart';
import 'package:movies_app/features/show_movies/domain/usecases/get_movie_cast_use_case.dart';
import 'package:movies_app/features/show_movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:movies_app/features/show_movies/domain/usecases/get_movie_reviews_use_case.dart';

part 'movie_details_state.dart';
part 'movie_details_cubit.freezed.dart';

class MovieDetailsCubit extends BaseCubit<MovieDetailsState> {
  MovieDetailsCubit(
    this._getMovieDetailsUseCase,
    this._getMovieCastUseCase,
    this._getMovieReviewsUseCase,
  ) : super(const MovieDetailsState.initial());
  final GetMovieDetailsUseCase _getMovieDetailsUseCase;
  final GetMovieCastUseCase _getMovieCastUseCase;
  final GetMovieReviewsUseCase _getMovieReviewsUseCase;
  late final MovieDetailsEntity movieDetails;
  List<MovieCastEntity> _movieCast = [];
  List<MovieReviewsEntity> _movieReviews = [];

  Future<void> getMovieDetails({required int movieId}) async {
    safeEmit(const MovieDetailsState.loading(isMovieDetails: true));
    final result = await _getMovieDetailsUseCase.call(movieId: movieId);
    result.when(
      success: (movieDetails) {
        this.movieDetails = movieDetails;

        safeEmit(
          MovieDetailsState.loaded(
            movieDetails: movieDetails,
            isMovieDetails: true,
            movieCast: _movieCast,
            movieReviews: _movieReviews,
          ),
        );
      },
      failure: (failure) {
        safeEmit(
          MovieDetailsState.failure(
            errMessage: failure.errMessage,
            isMovieDetails: true,
          ),
        );
      },
    );
  }

  Future<void> getMovieCast({required MovieDetailsEntity movieDetails}) async {
    safeEmit(const MovieDetailsState.loading(isMovieCast: true));
    final result = await _getMovieCastUseCase.call(movieId: movieDetails.id);
    result.when(
      success: (movieCast) {
        _movieCast = movieCast;
        safeEmit(
          MovieDetailsState.loaded(
            movieCast: movieCast,
            isMovieCast: true,
            movieDetails: movieDetails,
            movieReviews: _movieReviews,
          ),
        );
      },
      failure: (failure) {
        safeEmit(
          MovieDetailsState.failure(
            errMessage: failure.errMessage,
            isMovieCast: true,
          ),
        );
      },
    );
  }

  Future<void> getMovieReviews({
    required MovieDetailsEntity movieDetails,
  }) async {
    safeEmit(const MovieDetailsState.loading(isMovieReviews: true));
    final result = await _getMovieReviewsUseCase.call(movieId: movieDetails.id);

    result.when(
      success: (movieReviews) {
        _movieReviews = movieReviews;
        safeEmit(
          MovieDetailsState.loaded(
            movieReviews: movieReviews,
            isMovieReviews: true,
            movieDetails: movieDetails,
            movieCast: _movieCast,
          ),
        );
      },
      failure: (failure) {
        safeEmit(
          MovieDetailsState.failure(
            errMessage: failure.errMessage,
            isMovieReviews: true,
          ),
        );
      },
    );
  }
}
