import 'package:movies_app/core/utils/result.dart';
import 'package:movies_app/features/show_movies/domain/entities/movie_details_entity.dart';
import 'package:movies_app/features/show_movies/domain/repositories/movies_repo.dart';

class GetMovieDetailsUseCase {
  final MoviesRepo _moviesRepo;
  GetMovieDetailsUseCase(this._moviesRepo);
  Future<Result<MovieDetailsEntity>> call({required int movieId}) async {
    return await _moviesRepo.getMovieDetails(movieId: movieId);
  }
}
