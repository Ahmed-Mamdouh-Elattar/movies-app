import 'package:movies_app/core/utils/response_result.dart';
import 'package:movies_app/features/show_movies/domain/entities/movie_cast_entity.dart';
import 'package:movies_app/features/show_movies/domain/entities/movie_details_entity.dart';
import 'package:movies_app/features/show_movies/domain/entities/movie_reviews_entity.dart';
import 'package:movies_app/features/show_movies/domain/entities/movies_entity.dart';

abstract class MoviesRepo {
  Future<ResponseResult<List<MoviesEntity>>> getMoviesByCategory({
    required String category,
    required int page,
  });
  Future<ResponseResult<List<MoviesEntity>>> getRandomMovies({
    required int page,
  });
  Future<ResponseResult<MovieDetailsEntity>> getMovieDetails({
    required int movieId,
  });
  Future<ResponseResult<List<MovieCastEntity>>> getMovieCast({
    required int movieId,
  });
  Future<ResponseResult<List<MovieReviewsEntity>>> getMovieReviews({
    required int movieId,
  });
}
