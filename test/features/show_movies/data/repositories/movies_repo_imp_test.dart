import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_app/core/errors/server_failure.dart';
import 'package:movies_app/core/models/movie_details_model/movie_details_model.dart';
import 'package:movies_app/core/models/movies_model/movies_model.dart';
import 'package:movies_app/core/utils/response_result.dart';
import 'package:movies_app/features/show_movies/data/datasources/movies_data_source.dart';
import 'package:movies_app/features/show_movies/data/models/movie_cast_model/movie_cast_model.dart';
import 'package:movies_app/features/show_movies/data/models/movie_reviews_model/movie_reviews_model.dart';
import 'package:movies_app/features/show_movies/data/repositories/movies_repo_imp.dart';
import 'package:movies_app/features/show_movies/domain/entities/movie_cast_entity.dart';
import 'package:movies_app/features/show_movies/domain/entities/movie_details_entity.dart';
import 'package:movies_app/features/show_movies/domain/entities/movie_reviews_entity.dart';
import 'package:movies_app/features/show_movies/domain/entities/movies_entity.dart';
import 'package:movies_app/features/show_movies/domain/repositories/movies_repo.dart';

import 'movies_repo_imp_test.mocks.dart';

@GenerateMocks([MoviesDataSource])
void main() {
  late MoviesDataSource mockMoviesDataSource;
  late MoviesRepo moviesRepo;

  const tCategory = "action";
  const tPage = 1;
  const tMovieId = 1;
  final tFailure = DioException(
    requestOptions: RequestOptions(),
    message: "message",
    type: DioExceptionType.connectionError,
  );
  final tServerFailure = ServerFailure.fromDioError(tFailure);

  setUpAll(() {
    mockMoviesDataSource = MockMoviesDataSource();
    moviesRepo = MoviesRepoImp(mockMoviesDataSource);
  });

  setUp(() {
    reset(mockMoviesDataSource);
  });

  tearDown(() {
    verifyNoMoreInteractions(mockMoviesDataSource);
  });

  group("testing MoviesRepoImp class", () {
    group('getMoviesByCategory', () {
      test(
        'should return ResponseResult<List<MoviesEntity>> when success',
        () async {
          // arrange
          final expectedValue = const ResponseResult.success(<MoviesEntity>[]);
          when(
            mockMoviesDataSource.getMoviesByCategory(
              category: tCategory,
              page: tPage,
            ),
          ).thenAnswer(
            (_) async => MoviesModel(
              results: [],
              totalPages: 0,
              totalResults: 0,
              page: tPage,
            ),
          );

          // act
          final result = await moviesRepo.getMoviesByCategory(
            category: tCategory,
            page: tPage,
          );

          // assert
          expect(result, expectedValue);
          verify(
            mockMoviesDataSource.getMoviesByCategory(
              category: tCategory,
              page: tPage,
            ),
          ).called(1);
        },
      );
      test(
        'should return ResponseResult<List<MoviesEntity>> when failure',
        () async {
          // arrange
          final expectedValue = ResponseResult<List<MoviesEntity>>.failure(
            tServerFailure,
          );
          when(
            mockMoviesDataSource.getMoviesByCategory(
              category: tCategory,
              page: tPage,
            ),
          ).thenAnswer((_) async => throw tFailure);

          // act
          Future<ResponseResult<List<MoviesEntity>>> result() async =>
              await moviesRepo.getMoviesByCategory(
                category: tCategory,
                page: tPage,
              );

          // assert
          expect(await result(), expectedValue);
          verify(
            mockMoviesDataSource.getMoviesByCategory(
              category: tCategory,
              page: tPage,
            ),
          ).called(1);
        },
      );
    });
    group('getRandomMovies', () {
      test(
        'should return ResponseResult<List<MoviesEntity>> when success',
        () async {
          // arrange
          final expectedValue = const ResponseResult.success(<MoviesEntity>[]);
          when(mockMoviesDataSource.getRandomMovies(page: tPage)).thenAnswer(
            (_) async => MoviesModel(
              results: [],
              totalPages: 0,
              totalResults: 0,
              page: tPage,
            ),
          );

          // act
          final result = await moviesRepo.getRandomMovies(page: tPage);

          // assert
          expect(result, expectedValue);
          verify(mockMoviesDataSource.getRandomMovies(page: tPage)).called(1);
        },
      );
      test(
        'should return ResponseResult<List<MoviesEntity>> when failure',
        () async {
          // arrange
          final expectedValue = ResponseResult<List<MoviesEntity>>.failure(
            tServerFailure,
          );
          when(
            mockMoviesDataSource.getRandomMovies(page: tPage),
          ).thenAnswer((_) async => throw tFailure);

          // act
          Future<ResponseResult<List<MoviesEntity>>> result() async =>
              await moviesRepo.getRandomMovies(page: tPage);

          // assert
          expect(await result(), expectedValue);
          verify(mockMoviesDataSource.getRandomMovies(page: tPage)).called(1);
        },
      );
    });
    group("getMovieCast", () {
      test(
        'should return ResponseResult<List<MovieCastEntity>> when success',
        () async {
          // arrange
          final expectedValue = const ResponseResult.success(
            <MovieCastEntity>[],
          );
          when(
            mockMoviesDataSource.getMovieCast(movieId: tMovieId),
          ).thenAnswer((_) async => MovieCastModel(cast: [], crew: []));

          // act
          final result = await moviesRepo.getMovieCast(movieId: tMovieId);

          // assert
          expect(result, expectedValue);
          verify(
            mockMoviesDataSource.getMovieCast(movieId: tMovieId),
          ).called(1);
        },
      );
      test(
        'should return ResponseResult<List<MovieCastEntity>> when failure',
        () async {
          // arrange
          final expectedValue = ResponseResult<List<MovieCastEntity>>.failure(
            tServerFailure,
          );
          when(
            mockMoviesDataSource.getMovieCast(movieId: tMovieId),
          ).thenAnswer((_) async => throw tFailure);

          // act
          Future<ResponseResult<List<MovieCastEntity>>> result() async =>
              await moviesRepo.getMovieCast(movieId: tMovieId);

          // assert
          expect(await result(), expectedValue);
          verify(
            mockMoviesDataSource.getMovieCast(movieId: tMovieId),
          ).called(1);
        },
      );
    });
    group("getMovieDetails", () {
      test(
        'should return ResponseResult<MovieDetailsEntity> when success',
        () async {
          // arrange
          MovieDetailsModel movieDetailsModel = MovieDetailsModel(id: tMovieId);
          when(
            mockMoviesDataSource.getMovieDetails(movieId: tMovieId),
          ).thenAnswer((_) async => movieDetailsModel);

          // act
          final result = await moviesRepo.getMovieDetails(movieId: tMovieId);

          // assert
          expect(
            result,
            isA<ResponseResult<MovieDetailsEntity>>().having(
              (result) => result.when(
                success: (value) => value.id,
                failure: (failure) => failure,
              ),
              "check movie id",
              movieDetailsModel.id,
            ),
          );
          verify(
            mockMoviesDataSource.getMovieDetails(movieId: tMovieId),
          ).called(1);
        },
      );
      test(
        'should return ResponseResult<MovieDetailsEntity> when failure',
        () async {
          // arrange
          final expectedValue = ResponseResult<MovieDetailsEntity>.failure(
            tServerFailure,
          );
          when(
            mockMoviesDataSource.getMovieDetails(movieId: tMovieId),
          ).thenAnswer((_) async => throw tFailure);

          // act
          Future<ResponseResult<MovieDetailsEntity>> result() async =>
              await moviesRepo.getMovieDetails(movieId: tMovieId);

          // assert
          expect(await result(), expectedValue);
          verify(
            mockMoviesDataSource.getMovieDetails(movieId: tMovieId),
          ).called(1);
        },
      );
    });
    group("getMovieReviews", () {
      test(
        'should return ResponseResult<List<MovieReviewsEntity>> when success',
        () async {
          // arrange
          final expectedValue = const ResponseResult.success(
            <MovieReviewsEntity>[],
          );
          when(
            mockMoviesDataSource.getMovieReviews(movieId: tMovieId),
          ).thenAnswer((_) async => MovieReviewsModel(id: tMovieId));

          // act
          final result = await moviesRepo.getMovieReviews(movieId: tMovieId);

          // assert
          expect(result, expectedValue);
          verify(
            mockMoviesDataSource.getMovieReviews(movieId: tMovieId),
          ).called(1);
        },
      );
      test(
        'should return ResponseResult<List<MovieReviewEntity>> when failure',
        () async {
          // arrange
          final expectedValue =
              ResponseResult<List<MovieReviewsEntity>>.failure(tServerFailure);
          when(
            mockMoviesDataSource.getMovieReviews(movieId: tMovieId),
          ).thenAnswer((_) async => throw tFailure);

          // act
          Future<ResponseResult<List<MovieReviewsEntity>>> result() async =>
              await moviesRepo.getMovieReviews(movieId: tMovieId);

          // assert
          expect(await result(), expectedValue);
          verify(
            mockMoviesDataSource.getMovieReviews(movieId: tMovieId),
          ).called(1);
        },
      );
    });
  });
}
