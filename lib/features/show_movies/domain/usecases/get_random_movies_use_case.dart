import 'package:movies_app/core/utils/result.dart';
import 'package:movies_app/features/show_movies/domain/entities/movies_entity.dart';
import 'package:movies_app/features/show_movies/domain/repositories/movies_repo.dart';

class GetRandomMoviesUseCase {
  final MoviesRepo _moviesRepo;

  GetRandomMoviesUseCase(this._moviesRepo);

  Future<Result<List<MoviesEntity>>> call({required int page}) async {
    return await _moviesRepo.getRandomeMovies(page: page);
  }
}
