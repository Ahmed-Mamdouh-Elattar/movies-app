import 'package:dio/dio.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/core/errors/server_failure.dart';
import 'package:movies_app/core/utils/response_result.dart';
import 'package:movies_app/features/watch_list/data/datasources/watch_list_movies_source.dart';
import 'package:movies_app/features/watch_list/domain/entities/movie_watch_list_entity.dart';
import 'package:movies_app/features/watch_list/domain/repositories/watch_list_repo.dart';

class WatchListRepoImpl implements WatchListRepo {
  final WatchListMoviesSource _watchListMoviesSource;

  WatchListRepoImpl(this._watchListMoviesSource);
  @override
  Future<ResponseResult<List<MovieWatchListEntity>>>
  getWatchListMovies() async {
    try {
      final movies = await _watchListMoviesSource.getWatchListMovies();
      return ResponseResult.success(
        movies.map((movie) => movie.toWatchListEntity()).toList(),
      );
    } on DioException catch (e) {
      return ResponseResult.failure(ServerFailure.fromDioError(e));
    } catch (e) {
      return ResponseResult.failure(Failures(errMessage: e.toString()));
    }
  }
}
