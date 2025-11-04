import 'package:movies_app/core/utils/response_result.dart';
import 'package:movies_app/features/watch_list/domain/entities/movie_watch_list_entity.dart';

abstract class WatchListRepo {
  Future<ResponseResult<List<MovieWatchListEntity>>> getWatchListMovies();
}
