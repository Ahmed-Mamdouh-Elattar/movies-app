import 'package:movies_app/core/utils/response_result.dart';
import 'package:movies_app/features/watch_list/domain/entities/movie_watch_list_entity.dart';
import 'package:movies_app/features/watch_list/domain/repositories/watch_list_repo.dart';

class GetMoviesWatchListUseCase {
  final WatchListRepo _watchListRepo;

  GetMoviesWatchListUseCase(this._watchListRepo);

  Future<ResponseResult<List<MovieWatchListEntity>>> call() async {
    return await _watchListRepo.getWatchListMovies();
  }
}
