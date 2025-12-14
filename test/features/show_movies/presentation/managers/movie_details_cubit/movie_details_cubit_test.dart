import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/core/utils/response_result.dart';
import 'package:movies_app/features/show_movies/domain/entities/movie_cast_entity.dart';
import 'package:movies_app/features/show_movies/domain/entities/movie_details_entity.dart';
import 'package:movies_app/features/show_movies/domain/entities/movie_reviews_entity.dart';
import 'package:movies_app/features/show_movies/domain/usecases/get_movie_cast_use_case.dart';
import 'package:movies_app/features/show_movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:movies_app/features/show_movies/domain/usecases/get_movie_reviews_use_case.dart';
import 'package:movies_app/features/show_movies/presentation/managers/movie_details_cubit/movie_details_cubit.dart';

import 'movie_details_cubit_test.mocks.dart';

@GenerateMocks([
  GetMovieDetailsUseCase,
  GetMovieCastUseCase,
  GetMovieReviewsUseCase,
])
void main() {
  final tMovieId = 1;
  final tMovieDetailsEntity = MovieDetailsEntity(
    id: tMovieId,
    voting: 5,
    backDrop: "backDrop",
    overview: "overview",
    date: "date",
    duration: "duration",
    poster: "poster",
    title: "title",
    genres: ["genre1", "genre2"],
  );

  late MovieDetailsCubit movieDetailsCubit;
  late GetMovieDetailsUseCase mockGetMovieDetailsUseCase;
  late GetMovieCastUseCase mockGetMovieCastUseCase;
  late GetMovieReviewsUseCase mockGetMovieReviewsUseCase;
  setUpAll(() {
    mockGetMovieDetailsUseCase = MockGetMovieDetailsUseCase();
    mockGetMovieCastUseCase = MockGetMovieCastUseCase();
    mockGetMovieReviewsUseCase = MockGetMovieReviewsUseCase();
    movieDetailsCubit = MovieDetailsCubit(
      mockGetMovieDetailsUseCase,
      mockGetMovieCastUseCase,
      mockGetMovieReviewsUseCase,
    );
  });
  tearDown(() {
    reset(mockGetMovieDetailsUseCase);
    reset(mockGetMovieCastUseCase);
    reset(mockGetMovieReviewsUseCase);
  });
  tearDownAll(() {
    movieDetailsCubit.close();
  });

  group("testing MovieDetailsCubit", () {
    group("getMovieDetails", () {
      test(
        'should emit loading state then loaded state when getMovieDetails is called successfully',
        () {
          // arrange
          final expectedStates = [
            const MovieDetailsState.loading(isMovieDetails: true),
            MovieDetailsState.loaded(
              movieDetails: tMovieDetailsEntity,
              isMovieDetails: true,
              movieCast: [],
              movieReviews: [],
            ),
          ];
          provideDummy<ResponseResult<MovieDetailsEntity>>(
            ResponseResult.success(tMovieDetailsEntity),
          );
          when(mockGetMovieDetailsUseCase.call(movieId: tMovieId)).thenAnswer(
            (_) async => ResponseResult.success(tMovieDetailsEntity),
          );
          // assert
          expectLater(movieDetailsCubit.stream, emitsInOrder(expectedStates));
          // act
          movieDetailsCubit.getMovieDetails(movieId: tMovieId);
        },
      );
      test(
        "should emit loading state then failure state when getMovieDetails is called with failure",
        () {
          // arrange
          final expectedStates = [
            const MovieDetailsState.loading(isMovieDetails: true),
            const MovieDetailsState.failure(
              errMessage: "error",
              isMovieDetails: true,
            ),
          ];
          provideDummy<ResponseResult<MovieDetailsEntity>>(
            const ResponseResult.failure(Failures(errMessage: "error")),
          );
          when(mockGetMovieDetailsUseCase.call(movieId: tMovieId)).thenAnswer(
            (_) async =>
                const ResponseResult.failure(Failures(errMessage: "error")),
          );
          // assert
          expectLater(movieDetailsCubit.stream, emitsInOrder(expectedStates));
          // act
          movieDetailsCubit.getMovieDetails(movieId: tMovieId);
        },
      );
    });
    group("getMovieCast", () {
      test(
        "should emit loading state then loaded state when getMovieCast is called successfully",
        () {
          // arrange
          final expectedStates = [
            const MovieDetailsState.loading(isMovieCast: true),
            MovieDetailsState.loaded(
              movieCast: [],
              isMovieCast: true,
              movieDetails: tMovieDetailsEntity,
              movieReviews: [],
            ),
          ];
          provideDummy<ResponseResult<List<MovieCastEntity>>>(
            const ResponseResult.success([]),
          );
          when(mockGetMovieCastUseCase.call(movieId: tMovieId)).thenAnswer(
            (_) async =>
                const ResponseResult<List<MovieCastEntity>>.success([]),
          );
          // assert
          expectLater(movieDetailsCubit.stream, emitsInOrder(expectedStates));
          // act
          movieDetailsCubit.getMovieCast(movieDetails: tMovieDetailsEntity);
        },
      );
      test(
        "should emit loading state then failure state when getMovieCast is called with failure",
        () {
          // arrange
          final expectedStates = [
            const MovieDetailsState.loading(isMovieCast: true),
            const MovieDetailsState.failure(
              errMessage: "error",
              isMovieCast: true,
            ),
          ];
          provideDummy<ResponseResult<List<MovieCastEntity>>>(
            const ResponseResult.failure(Failures(errMessage: "error")),
          );
          when(mockGetMovieCastUseCase.call(movieId: tMovieId)).thenAnswer(
            (_) async =>
                const ResponseResult.failure(Failures(errMessage: "error")),
          );
          // assert
          expectLater(movieDetailsCubit.stream, emitsInOrder(expectedStates));
          // act
          movieDetailsCubit.getMovieCast(movieDetails: tMovieDetailsEntity);
        },
      );
    });
    group("getMovieReviews", () {
      test(
        "should emit loading state then loaded state when getMovieReviews is called successfully",
        () {
          // arrange
          final expectedStates = [
            const MovieDetailsState.loading(isMovieReviews: true),
            MovieDetailsState.loaded(
              movieReviews: [],
              isMovieReviews: true,
              movieDetails: tMovieDetailsEntity,
              movieCast: [],
            ),
          ];
          provideDummy<ResponseResult<List<MovieReviewsEntity>>>(
            const ResponseResult.success([]),
          );
          when(mockGetMovieReviewsUseCase.call(movieId: tMovieId)).thenAnswer(
            (_) async =>
                const ResponseResult<List<MovieReviewsEntity>>.success([]),
          );
          // assert
          expectLater(movieDetailsCubit.stream, emitsInOrder(expectedStates));
          // act
          movieDetailsCubit.getMovieReviews(movieDetails: tMovieDetailsEntity);
        },
      );
      test(
        "should emit loading state then failure state when getMovieReviews is called with failure",
        () {
          // arrange
          final expectedStates = [
            const MovieDetailsState.loading(isMovieReviews: true),
            const MovieDetailsState.failure(
              errMessage: "error",
              isMovieReviews: true,
            ),
          ];
          provideDummy<ResponseResult<List<MovieReviewsEntity>>>(
            const ResponseResult.failure(Failures(errMessage: "error")),
          );
          when(mockGetMovieReviewsUseCase.call(movieId: tMovieId)).thenAnswer(
            (_) async =>
                const ResponseResult.failure(Failures(errMessage: "error")),
          );
          // assert
          expectLater(movieDetailsCubit.stream, emitsInOrder(expectedStates));
          // act
          movieDetailsCubit.getMovieReviews(movieDetails: tMovieDetailsEntity);
        },
      );
    });
  });
}
