import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_app/core/helper/constants.dart';
import 'package:movies_app/core/models/movie_details_model/movie_details_model.dart';
import 'package:movies_app/core/services/api/api_service.dart';
import 'package:movies_app/core/services/shared_preferences/shared_preferences_service.dart';
import 'package:movies_app/features/watch_list/data/datasources/watch_list_movies_source.dart';

import '../../../../core/mocks/api_service.mocks.dart';
import '../../../../core/services/shared_preferences/shared_preferences_service_test.mocks.dart';

void main() {
  late SharedPreferencesService sharedPreferencesService;
  late ApiService apiService;
  late WatchListMoviesSource watchListMoviesSource;
  const movieId = 1;
  setUp(() {
    sharedPreferencesService = MockSharedPreferencesService();
    apiService = MockApiService();
    watchListMoviesSource = WatchListMoviesSource(
      apiService,
      sharedPreferencesService,
    );
  });
  group("test watch list movies source", () {
    group("test getWatchListMovies", () {
      test(
        "should return list of movies when getWatchListMovies is called",
        () async {
          //arrange
          when(
            sharedPreferencesService.getList(key: kWatchListKey),
          ).thenAnswer((_) => ["$movieId"]);
          when(
            apiService.getMovieDetails(movieId: movieId),
          ).thenAnswer((_) async => MovieDetailsModel(id: movieId));
          //act
          final result = await watchListMoviesSource.getWatchListMovies();
          //assert
          expect(
            result,
            isA<List<MovieDetailsModel>>().having(
              (list) => list[0].id,
              "check movie id ",
              movieId,
            ),
          );
          verify(apiService.getMovieDetails(movieId: movieId)).called(1);
          verifyNoMoreInteractions(apiService);
          verify(
            sharedPreferencesService.getList(key: kWatchListKey),
          ).called(1);
          verifyNoMoreInteractions(sharedPreferencesService);
        },
      );
      test(
        "should return empty list when getWatchListMovies is called and watch list is empty",
        () async {
          //arrange
          when(
            sharedPreferencesService.getList(key: kWatchListKey),
          ).thenAnswer((_) => []);
          //act
          final result = await watchListMoviesSource.getWatchListMovies();
          //assert
          expect(result, []);
          verifyNoMoreInteractions(apiService);
          verify(
            sharedPreferencesService.getList(key: kWatchListKey),
          ).called(1);
          verifyNoMoreInteractions(sharedPreferencesService);
        },
      );
      test(
        "should throw exception when getWatchListMovies is called and fails",
        () async {
          //arrange
          when(
            sharedPreferencesService.getList(key: kWatchListKey),
          ).thenAnswer((_) => ["$movieId"]);
          when(
            apiService.getMovieDetails(movieId: movieId),
          ).thenThrow(Exception());
          //act
          result() async {
            return await watchListMoviesSource.getWatchListMovies();
          }

          //assert
          expect(result(), throwsException);
          verify(apiService.getMovieDetails(movieId: movieId)).called(1);
          verifyNoMoreInteractions(apiService);
          verify(
            sharedPreferencesService.getList(key: kWatchListKey),
          ).called(1);
          verifyNoMoreInteractions(sharedPreferencesService);
        },
      );
    });
  });
}
