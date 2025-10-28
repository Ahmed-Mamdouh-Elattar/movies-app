import 'package:movies_app/core/utils/result.dart';
import 'package:movies_app/features/show_movies/domain/entities/movie_reviews_entity.dart';
import 'package:movies_app/features/show_movies/domain/repositories/movies_repo.dart';

class GetMovieReviewsUseCase {
  final MoviesRepo _moviesRepo;
  GetMovieReviewsUseCase(this._moviesRepo);
  Future<Result<List<MovieReviewsEntity>>> call({required int movieId}) async {
    return await _moviesRepo.getMovieReviews(movieId: movieId);
  }
}
