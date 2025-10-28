import 'package:movies_app/core/utils/result.dart';
import 'package:movies_app/features/show_movies/domain/entities/movie_cast_entity.dart';
import 'package:movies_app/features/show_movies/domain/repositories/movies_repo.dart';

class GetMovieCastUseCase {
  final MoviesRepo _moviesRepo;
  GetMovieCastUseCase(this._moviesRepo);
  Future<Result<List<MovieCastEntity>>> call({required int movieId}) async {
    return await _moviesRepo.getMovieCast(movieId: movieId);
  }
}
