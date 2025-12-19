import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_app/core/models/movie_details_model/movie_details_model.dart';
import 'package:movies_app/core/models/movies_model/movies_model.dart';
import 'package:movies_app/core/services/api/api_service.dart';
import 'package:movies_app/features/show_movies/data/datasources/movies_data_source.dart';
import 'package:movies_app/features/show_movies/data/models/movie_cast_model/movie_cast_model.dart';
import 'package:movies_app/features/show_movies/data/models/movie_reviews_model/movie_reviews_model.dart';

import '../../../../core/mocks/api_service/api_service.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  late ApiService mockApiService;
  late MoviesDataSource moviesDataSource;
  setUp(() {
    mockApiService = MockApiService();
    moviesDataSource = MoviesDataSourceImpl(mockApiService);
  });
  group("testing MoviesDataSourceImpl class", () {
    group("getMoviesByCategory()", () {
      test(
        "Should return MoviesModel when getMoviesByCategory is called",
        () async {
          //arrange
          String category = "popular";
          int page = 1;
          final expectedMoviesModel = MoviesModel(
            results: [],
            totalPages: 0,
            totalResults: 0,
            page: 1,
          );
          when(
            mockApiService.getMoviesByCategory(category: category, page: page),
          ).thenAnswer((_) => Future.value(expectedMoviesModel));

          //act
          final result = await moviesDataSource.getMoviesByCategory(
            category: category,
            page: page,
          );

          //assert
          expect(result, expectedMoviesModel);
          verify(
            mockApiService.getMoviesByCategory(category: category, page: page),
          ).called(1);
          verifyNoMoreInteractions(mockApiService);
        },
      );
      test("Should throw exception when getMoviesByCategory fails", () async {
        //arrange
        String category = "popular";
        int page = 1;

        when(
          mockApiService.getMoviesByCategory(category: category, page: page),
        ).thenAnswer((_) async => throw Exception());

        //act
        Future<MoviesModel> result() async => await moviesDataSource
            .getMoviesByCategory(category: category, page: page);

        //assert
        expect(result(), throwsException);
        verify(
          mockApiService.getMoviesByCategory(category: category, page: page),
        ).called(1);
        verifyNoMoreInteractions(mockApiService);
      });
    });

    group("getRandomMovies()", () {
      test(
        "Should return MoviesModel when getRandomMovies is called",
        () async {
          //arrange
          int page = 1;
          final expectedMoviesModel = MoviesModel(
            results: [],
            totalPages: 0,
            totalResults: 0,
            page: 1,
          );
          when(
            mockApiService.getRandomeMovies(page: page),
          ).thenAnswer((_) => Future.value(expectedMoviesModel));

          //act
          final result = await moviesDataSource.getRandomMovies(page: page);

          //assert
          expect(result, expectedMoviesModel);
          verify(mockApiService.getRandomeMovies(page: page)).called(1);
          verifyNoMoreInteractions(mockApiService);
        },
      );
      test("Should throw exception when getRandomMovies fails", () async {
        //arrange
        int page = 1;

        when(
          mockApiService.getRandomeMovies(page: page),
        ).thenAnswer((_) async => throw Exception());

        //act
        Future<MoviesModel> result() async =>
            await moviesDataSource.getRandomMovies(page: page);

        //assert
        expect(result(), throwsException);
        verify(mockApiService.getRandomeMovies(page: page)).called(1);
        verifyNoMoreInteractions(mockApiService);
      });
    });

    group("getMovieCast()", () {
      test(
        "Should return MovieCastModel when getMovieCast is called",
        () async {
          //arrange
          int movieId = 1;
          final expectedMovieCastModel = MovieCastModel(cast: [], crew: []);
          when(
            mockApiService.getMovieCast(movieId: movieId),
          ).thenAnswer((_) => Future.value(expectedMovieCastModel));

          //act
          final result = await moviesDataSource.getMovieCast(movieId: movieId);

          //assert
          expect(result, expectedMovieCastModel);
          verify(mockApiService.getMovieCast(movieId: movieId)).called(1);
          verifyNoMoreInteractions(mockApiService);
        },
      );
      test("Should throw exception when getMovieCast fails", () async {
        //arrange
        int movieId = 1;

        when(
          mockApiService.getMovieCast(movieId: movieId),
        ).thenAnswer((_) async => throw Exception());

        //act
        Future<MovieCastModel> result() async =>
            await moviesDataSource.getMovieCast(movieId: movieId);

        //assert
        expect(result(), throwsException);
        verify(mockApiService.getMovieCast(movieId: movieId)).called(1);
        verifyNoMoreInteractions(mockApiService);
      });
    });

    group("getMovieDetails()", () {
      test(
        "Should return MovieDetailsModel when getMovieDetails is called",
        () async {
          //arrange
          int movieId = 1;
          final expectedMovieDetailsModel = MovieDetailsModel(
            adult: false,
            backdropPath: "",
            budget: 0,
            genres: [],
            homepage: "",
            id: 0,
            imdbId: "",
            originalLanguage: "",
            originalTitle: "",
            overview: "",
            popularity: 0,
            posterPath: "",
            productionCompanies: [],
            productionCountries: [],
            releaseDate: "",
            revenue: 0,
            runtime: 0,
            spokenLanguages: [],
            status: "",
            tagline: "",
            title: "",
            video: false,
            voteAverage: 0,
            voteCount: 0,
          );
          when(
            mockApiService.getMovieDetails(movieId: movieId),
          ).thenAnswer((_) => Future.value(expectedMovieDetailsModel));

          //act
          final result = await moviesDataSource.getMovieDetails(
            movieId: movieId,
          );

          //assert
          expect(result, expectedMovieDetailsModel);
          verify(mockApiService.getMovieDetails(movieId: movieId)).called(1);
          verifyNoMoreInteractions(mockApiService);
        },
      );
      test("Should throw exception when getMovieDetails fails", () async {
        //arrange
        int movieId = 1;

        when(
          mockApiService.getMovieDetails(movieId: movieId),
        ).thenAnswer((_) async => throw Exception());

        //act
        Future<MovieDetailsModel> result() async =>
            await moviesDataSource.getMovieDetails(movieId: movieId);

        //assert
        expect(result(), throwsException);
        verify(mockApiService.getMovieDetails(movieId: movieId)).called(1);
        verifyNoMoreInteractions(mockApiService);
      });
    });

    group("getMovieReviews()", () {
      test(
        "Should return MovieReviewsModel when getMovieReviews is called",
        () async {
          //arrange
          int movieId = 1;
          final expectedMovieReviewsModel = MovieReviewsModel(
            results: [],
            totalPages: 0,
            totalResults: 0,
            page: 1,
          );
          when(
            mockApiService.getMovieReviews(movieId: movieId),
          ).thenAnswer((_) => Future.value(expectedMovieReviewsModel));

          //act
          final result = await moviesDataSource.getMovieReviews(
            movieId: movieId,
          );

          //assert
          expect(result, expectedMovieReviewsModel);
          verify(mockApiService.getMovieReviews(movieId: movieId)).called(1);
          verifyNoMoreInteractions(mockApiService);
        },
      );
      test("Should throw exception when getMovieReviews fails", () async {
        //arrange
        int movieId = 1;

        when(
          mockApiService.getMovieReviews(movieId: movieId),
        ).thenAnswer((_) async => throw Exception());

        //act
        Future<MovieReviewsModel> result() async =>
            await moviesDataSource.getMovieReviews(movieId: movieId);

        //assert
        expect(result(), throwsException);
        verify(mockApiService.getMovieReviews(movieId: movieId)).called(1);
        verifyNoMoreInteractions(mockApiService);
      });
    });
  });
}
