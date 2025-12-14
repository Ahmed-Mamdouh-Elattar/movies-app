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

  setUp(() {
    mockMoviesDataSource = MockMoviesDataSource();
    moviesRepo = MoviesRepoImp(mockMoviesDataSource);
  });

  group("testing MoviesRepoImp class", () {
    group('getMoviesByCategory', () {
      test(
        'should return ResponseResult<List<MoviesEntity>> when success',
        () async {
          // arrange
          String category = "action";
          int page = 1;
          final expectedValue = const ResponseResult.success(<MoviesEntity>[]);
          when(
            mockMoviesDataSource.getMoviesByCategory(
              category: category,
              page: page,
            ),
          ).thenAnswer(
            (_) async => MoviesModel(
              results: [],
              totalPages: 0,
              totalResults: 0,
              page: page,
            ),
          );

          // act
          final result = await moviesRepo.getMoviesByCategory(
            category: category,
            page: page,
          );

          // assert
          expect(result, expectedValue);
          verify(
            mockMoviesDataSource.getMoviesByCategory(
              category: category,
              page: page,
            ),
          ).called(1);
          verifyNoMoreInteractions(mockMoviesDataSource);
        },
      );
      test(
        'should return ResponseResult<List<MoviesEntity>> when failure',
        () async {
          // arrange
          String category = "action";
          int page = 1;
          final failure = DioException(
            requestOptions: RequestOptions(),
            message: "message",
            type: DioExceptionType.connectionError,
          );
          final expectedValue = ResponseResult<List<MoviesEntity>>.failure(
            ServerFailure.fromDioError(failure),
          );
          when(
            mockMoviesDataSource.getMoviesByCategory(
              category: category,
              page: page,
            ),
          ).thenAnswer((_) async => throw failure);

          // act
          Future<ResponseResult<List<MoviesEntity>>> result() async =>
              await moviesRepo.getMoviesByCategory(
                category: category,
                page: page,
              );

          // assert
          expect(await result(), expectedValue);
          verify(
            mockMoviesDataSource.getMoviesByCategory(
              category: category,
              page: page,
            ),
          ).called(1);
          verifyNoMoreInteractions(mockMoviesDataSource);
        },
      );
    });
    group('getRandomMovies', () {
      test(
        'should return ResponseResult<List<MoviesEntity>> when success',
        () async {
          // arrange
          int page = 1;
          final expectedValue = const ResponseResult.success(<MoviesEntity>[]);
          when(mockMoviesDataSource.getRandomMovies(page: page)).thenAnswer(
            (_) async => MoviesModel(
              results: [],
              totalPages: 0,
              totalResults: 0,
              page: page,
            ),
          );

          // act
          final result = await moviesRepo.getRandomMovies(page: page);

          // assert
          expect(result, expectedValue);
          verify(mockMoviesDataSource.getRandomMovies(page: page)).called(1);
          verifyNoMoreInteractions(mockMoviesDataSource);
        },
      );
      test(
        'should return ResponseResult<List<MoviesEntity>> when failure',
        () async {
          // arrange
          int page = 1;
          final failure = DioException(
            requestOptions: RequestOptions(),
            message: "message",
            type: DioExceptionType.connectionError,
          );
          final expectedValue = ResponseResult<List<MoviesEntity>>.failure(
            ServerFailure.fromDioError(failure),
          );
          when(
            mockMoviesDataSource.getRandomMovies(page: page),
          ).thenAnswer((_) async => throw failure);

          // act
          Future<ResponseResult<List<MoviesEntity>>> result() async =>
              await moviesRepo.getRandomMovies(page: page);

          // assert
          expect(await result(), expectedValue);
          verify(mockMoviesDataSource.getRandomMovies(page: page)).called(1);
          verifyNoMoreInteractions(mockMoviesDataSource);
        },
      );
    });
    group("getMovieCast", () {
      test(
        'should return ResponseResult<List<MovieCastEntity>> when success',
        () async {
          // arrange
          int movieId = 1;
          final expectedValue = const ResponseResult.success(
            <MovieCastEntity>[],
          );
          when(
            mockMoviesDataSource.getMovieCast(movieId: movieId),
          ).thenAnswer((_) async => MovieCastModel(cast: [], crew: []));

          // act
          final result = await moviesRepo.getMovieCast(movieId: movieId);

          // assert
          expect(result, expectedValue);
          verify(mockMoviesDataSource.getMovieCast(movieId: movieId)).called(1);
          verifyNoMoreInteractions(mockMoviesDataSource);
        },
      );
      test(
        'should return ResponseResult<List<MovieCastEntity>> when failure',
        () async {
          // arrange
          int movieId = 1;
          final failure = DioException(
            requestOptions: RequestOptions(),
            message: "message",
            type: DioExceptionType.connectionError,
          );
          final expectedValue = ResponseResult<List<MovieCastEntity>>.failure(
            ServerFailure.fromDioError(failure),
          );
          when(
            mockMoviesDataSource.getMovieCast(movieId: movieId),
          ).thenAnswer((_) async => throw failure);

          // act
          Future<ResponseResult<List<MovieCastEntity>>> result() async =>
              await moviesRepo.getMovieCast(movieId: movieId);

          // assert
          expect(await result(), expectedValue);
          verify(mockMoviesDataSource.getMovieCast(movieId: movieId)).called(1);
          verifyNoMoreInteractions(mockMoviesDataSource);
        },
      );
    });
    group("getMovieDetails", () {
      test(
        'should return ResponseResult<MovieDetailsEntity> when success',
        () async {
          // arrange
          int movieId = 1;
          MovieDetailsModel movieDetailsModel = MovieDetailsModel(id: movieId);
          when(
            mockMoviesDataSource.getMovieDetails(movieId: movieId),
          ).thenAnswer((_) async => movieDetailsModel);

          // act
          final result = await moviesRepo.getMovieDetails(movieId: movieId);

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
            mockMoviesDataSource.getMovieDetails(movieId: movieId),
          ).called(1);
          verifyNoMoreInteractions(mockMoviesDataSource);
        },
      );
      test(
        'should return ResponseResult<MovieDetailsEntity> when failure',
        () async {
          // arrange
          int movieId = 1;
          final failure = DioException(
            requestOptions: RequestOptions(),
            message: "message",
            type: DioExceptionType.connectionError,
          );
          final expectedValue = ResponseResult<MovieDetailsEntity>.failure(
            ServerFailure.fromDioError(failure),
          );
          when(
            mockMoviesDataSource.getMovieDetails(movieId: movieId),
          ).thenAnswer((_) async => throw failure);

          // act
          Future<ResponseResult<MovieDetailsEntity>> result() async =>
              await moviesRepo.getMovieDetails(movieId: movieId);

          // assert
          expect(await result(), expectedValue);
          verify(
            mockMoviesDataSource.getMovieDetails(movieId: movieId),
          ).called(1);
          verifyNoMoreInteractions(mockMoviesDataSource);
        },
      );
    });
    group("getMovieReviews", () {
      test(
        'should return ResponseResult<List<MovieReviewsEntity>> when success',
        () async {
          // arrange
          int movieId = 1;
          final expectedValue = const ResponseResult.success(
            <MovieReviewsEntity>[],
          );
          when(
            mockMoviesDataSource.getMovieReviews(movieId: movieId),
          ).thenAnswer((_) async => MovieReviewsModel(id: movieId));

          // act
          final result = await moviesRepo.getMovieReviews(movieId: movieId);

          // assert
          expect(result, expectedValue);
          verify(
            mockMoviesDataSource.getMovieReviews(movieId: movieId),
          ).called(1);
          verifyNoMoreInteractions(mockMoviesDataSource);
        },
      );
      test(
        'should return ResponseResult<List<MovieReviewEntity>> when failure',
        () async {
          // arrange
          int movieId = 1;
          final failure = DioException(
            requestOptions: RequestOptions(),
            message: "message",
            type: DioExceptionType.connectionError,
          );
          final expectedValue =
              ResponseResult<List<MovieReviewsEntity>>.failure(
                ServerFailure.fromDioError(failure),
              );
          when(
            mockMoviesDataSource.getMovieReviews(movieId: movieId),
          ).thenAnswer((_) async => throw failure);

          // act
          Future<ResponseResult<List<MovieReviewsEntity>>> result() async =>
              await moviesRepo.getMovieReviews(movieId: movieId);

          // assert
          expect(await result(), expectedValue);
          verify(
            mockMoviesDataSource.getMovieReviews(movieId: movieId),
          ).called(1);
          verifyNoMoreInteractions(mockMoviesDataSource);
        },
      );
    });
  });
}
