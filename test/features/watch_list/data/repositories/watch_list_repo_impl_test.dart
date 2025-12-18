import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_app/core/errors/server_failure.dart';
import 'package:movies_app/core/models/movie_details_model/movie_details_model.dart';
import 'package:movies_app/core/utils/response_result.dart';
import 'package:movies_app/features/watch_list/data/datasources/watch_list_movies_source.dart';
import 'package:movies_app/features/watch_list/data/repositories/watch_list_repo_impl.dart';
import 'package:movies_app/features/watch_list/domain/entities/movie_watch_list_entity.dart';

import 'watch_list_repo_impl_test.mocks.dart';

@GenerateMocks([WatchListMoviesSource])
void main() {
  late WatchListMoviesSource watchListMoviesSource;
  late WatchListRepoImpl watchListRepoImpl;

  setUp(() {
    watchListMoviesSource = MockWatchListMoviesSource();
    watchListRepoImpl = WatchListRepoImpl(watchListMoviesSource);
  });
  group("test watch list repo impl", () {
    group("getWatchListMovies", () {
      test(
        "should return ResponseResult<List<MovieWatchListEntity>> when the call to data source is successful",
        () async {
          //arrange
          MovieDetailsModel movieDetailsModel = MovieDetailsModel(id: 1);

          when(
            watchListMoviesSource.getWatchListMovies(),
          ).thenAnswer((_) async => [movieDetailsModel]);
          //act
          final result = await watchListRepoImpl.getWatchListMovies();
          //assert
          expect(result, isA<ResponseResult<List<MovieWatchListEntity>>>());
        },
      );
      test(
        "should return ResponseResult<List<MovieWatchListEntity>> when the call to data source fails",
        () async {
          //arrange
          final tFailure = DioException(
            requestOptions: RequestOptions(),
            type: DioExceptionType.connectionTimeout,
          );
          final expectedValue =
              ResponseResult<List<MovieWatchListEntity>>.failure(
                ServerFailure.fromDioError(tFailure),
              );
          when(watchListMoviesSource.getWatchListMovies()).thenThrow(tFailure);
          //act
          final result = await watchListRepoImpl.getWatchListMovies();
          //assert
          expect(result, expectedValue);
        },
      );
    });
  });
}
