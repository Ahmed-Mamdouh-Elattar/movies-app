import 'package:movies_app/core/utils/result.dart';
import 'package:movies_app/features/show_movies/domain/entities/movies_entity.dart';

abstract class MoviesRepo {
  Future<Result<List<MoviesEntity>>> getMoviesByCategory({
    required String category,
    required int page,
  });
  Future<Result<List<MoviesEntity>>> getRandomeMovies({required int page});
}
