import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/core/utils/result.dart';
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
  late final MovieDetailsEntity _movieDetails;
  List<MovieCastEntity> _movieCast = [];
  List<MovieReviewsEntity> _movieReviews = [];

  Future<void> getMovieDetails({required int movieId}) async {
    safeEmit(const MovieDetailsState.loading(isMovieDetails: true));
    final result = await _getMovieDetailsUseCase.call(movieId: movieId);
    result.when(
      success: (movieDetails) {
        _movieDetails = movieDetails;

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

  Future<void> getMovieCast() async {
    safeEmit(const MovieDetailsState.loading(isMovieCast: true));
    final result = await _getMovieCastUseCase.call(movieId: _movieDetails.id);
    result.when(
      success: (movieCast) {
        _movieCast = movieCast;
        safeEmit(
          MovieDetailsState.loaded(
            movieCast: movieCast,
            isMovieCast: true,
            movieDetails: _movieDetails,
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

  Future<void> getMovieReviews() async {
    safeEmit(const MovieDetailsState.loading(isMovieReviews: true));
    final result = await _getMovieReviewsUseCase.call(
      movieId: _movieDetails.id,
    );

    result.when(
      success: (movieReviews) {
        _movieReviews = movieReviews;
        safeEmit(
          MovieDetailsState.loaded(
            movieReviews: movieReviews,
            isMovieReviews: true,
            movieDetails: _movieDetails,
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
