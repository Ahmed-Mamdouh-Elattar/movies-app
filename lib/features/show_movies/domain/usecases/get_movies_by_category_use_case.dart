import 'package:movies_app/core/utils/result.dart';
import 'package:movies_app/features/show_movies/domain/entities/movies_entity.dart';
import 'package:movies_app/features/show_movies/domain/repositories/movies_repo.dart';

class GetMoviesByCategoryUseCase {
  final MoviesRepo _moviesRepo;

  GetMoviesByCategoryUseCase(this._moviesRepo);

  Future<Result<List<MoviesEntity>>> call({
    required String category,
    required int page,
  }) async {
    return await _moviesRepo.getMoviesByCategory(
      category: category,
      page: page,
    );
  }
}
