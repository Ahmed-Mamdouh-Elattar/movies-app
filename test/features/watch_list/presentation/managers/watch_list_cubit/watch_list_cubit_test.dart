import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/core/helper/constants.dart';
import 'package:movies_app/core/services/shared_preferences/shared_preferences_service.dart';
import 'package:movies_app/core/utils/response_result.dart';
import 'package:movies_app/features/watch_list/domain/entities/movie_watch_list_entity.dart';
import 'package:movies_app/features/watch_list/domain/usecases/get_movies_watch_list_use_case.dart';
import 'package:movies_app/features/watch_list/presentation/managers/watch_list_cubit/watch_list_cubit.dart';

import '../../../../../core/mocks/shared_preferences/shared_preferences_service_test.mocks.dart';
import 'watch_list_cubit_test.mocks.dart';

@GenerateMocks([GetMoviesWatchListUseCase])
void main() {
  late GetMoviesWatchListUseCase mockGetMoviesWatchListUseCase;
  late WatchListCubit watchListCubit;
  late SharedPreferencesService mockSharedPreferencesService;

  setUp(() {
    mockGetMoviesWatchListUseCase = MockGetMoviesWatchListUseCase();
    mockSharedPreferencesService = MockSharedPreferencesService();
    watchListCubit = WatchListCubit(
      mockGetMoviesWatchListUseCase,
      mockSharedPreferencesService,
    );
  });
  tearDown(() {
    watchListCubit.close();
  });

  group("test watch list cubit", () {
    group("addOrDeleteMovieToWatchList", () {
      test(
        "should emit [WatchListState.addOrDeleteMovieSuccess(isExisted: true)] when movie is added",
        () {
          //arrange
          const expectedState = WatchListState.addOrDeleteMovieSuccess(
            isExisted: true,
          );
          when(
            mockSharedPreferencesService.getList(key: kWatchListKey),
          ).thenAnswer((_) => []);
          when(
            mockSharedPreferencesService.setList(
              key: kWatchListKey,
              value: ["1"],
            ),
          ).thenAnswer((_) => Future.value());

          //act
          watchListCubit.addOrDeleteMovieToWatchList("1");
          //assert
          expect(watchListCubit.state, expectedState);
        },
      );
      test(
        "should emit [WatchListState.addOrDeleteMovieSuccess(isExisted: false)] when movie is deleted",
        () {
          //arrange
          const expectedState = WatchListState.addOrDeleteMovieSuccess(
            isExisted: false,
          );
          when(
            mockSharedPreferencesService.getList(key: kWatchListKey),
          ).thenAnswer((_) => ["1"]);
          when(
            mockSharedPreferencesService.setList(key: kWatchListKey, value: []),
          ).thenAnswer((_) => Future.value());

          //act
          watchListCubit.addOrDeleteMovieToWatchList("1");
          //assert
          expect(watchListCubit.state, expectedState);
        },
      );
    });
    group("isMovieExistedInWatchList()", () {
      test(
        "should emit [WatchListState.addOrDeleteMovieSuccess(isExisted: true)] when movie is existed",
        () {
          //arrange
          const expectedState = WatchListState.addOrDeleteMovieSuccess(
            isExisted: true,
          );
          //act
          watchListCubit.isMovieExistedInWatchList("1", ["1"]);
          //assert
          expect(watchListCubit.state, expectedState);
        },
      );

      test(
        "should emit [WatchListState.addOrDeleteMovieSuccess(isExisted: false)] when movie is not existed",
        () {
          //arrange
          const expectedState = WatchListState.addOrDeleteMovieSuccess(
            isExisted: false,
          );
          //act
          watchListCubit.isMovieExistedInWatchList("1", ["2"]);
          //assert
          expect(watchListCubit.state, expectedState);
        },
      );
    });
    group("getWatchListMovies()", () {
      test(
        "should emit [Loading, Success] when getWatchListMovies is successful",
        () async {
          //arrange
          const expectedStates = [
            WatchListState.loading(),
            WatchListState.success(movies: []),
          ];
          provideDummy<ResponseResult<List<MovieWatchListEntity>>>(
            const ResponseResult.success([]),
          );
          when(mockGetMoviesWatchListUseCase.call()).thenAnswer(
            (_) async =>
                const ResponseResult<List<MovieWatchListEntity>>.success([]),
          );
          //assert
          expectLater(watchListCubit.stream, emitsInOrder(expectedStates));
          //act
          await watchListCubit.getWatchListMovies();
        },
      );
      test(
        "should emit [Loading, Error] when getWatchListMovies is not successful",
        () async {
          //arrange
          const expectedStates = [
            WatchListState.loading(),
            WatchListState.failure(errMessage: ""),
          ];
          provideDummy<ResponseResult<List<MovieWatchListEntity>>>(
            const ResponseResult.failure(Failures(errMessage: "")),
          );
          when(mockGetMoviesWatchListUseCase.call()).thenAnswer(
            (_) async =>
                const ResponseResult<List<MovieWatchListEntity>>.failure(
                  Failures(errMessage: ""),
                ),
          );
          //assert
          expectLater(watchListCubit.stream, emitsInOrder(expectedStates));
          //act
          await watchListCubit.getWatchListMovies();
        },
      );
    });
  });
}
