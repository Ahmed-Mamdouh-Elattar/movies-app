import 'package:movies_app/core/utils/result.dart';
import 'package:movies_app/features/show_movies/domain/entities/movie_cast_entity.dart';
import 'package:movies_app/features/show_movies/domain/entities/movie_details_entity.dart';
import 'package:movies_app/features/show_movies/domain/entities/movie_reviews_entity.dart';
import 'package:movies_app/features/show_movies/domain/entities/movies_entity.dart';

abstract class MoviesRepo {
  Future<Result<List<MoviesEntity>>> getMoviesByCategory({
    required String category,
    required int page,
  });
  Future<Result<List<MoviesEntity>>> getRandomeMovies({required int page});
  Future<Result<MovieDetailsEntity>> getMovieDetails({required int movieId});
  Future<Result<List<MovieCastEntity>>> getMovieCast({required int movieId});
  Future<Result<List<MovieReviewsEntity>>> getMovieReviews({
    required int movieId,
  });
}
