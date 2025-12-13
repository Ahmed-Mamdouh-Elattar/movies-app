import 'package:movies_app/core/services/api/api_service.dart';
import 'package:movies_app/features/show_movies/data/models/movie_cast_model/movie_cast_model.dart';
import 'package:movies_app/core/models/movie_details_model/movie_details_model.dart';
import 'package:movies_app/features/show_movies/data/models/movie_reviews_model/movie_reviews_model.dart';
import 'package:movies_app/core/models/movies_model/movies_model.dart';

abstract class MoviesDataSource {
  Future<MoviesModel> getMoviesByCategory({
    required String category,
    required int page,
  });
  Future<MoviesModel> getRandomeMovies({required int page});
  Future<MovieDetailsModel> getMovieDetails({required int movieId});
  Future<MovieCastModel> getMovieCast({required int movieId});
  Future<MovieReviewsModel> getMovieReviews({required int movieId});
}

class MoviesDataSourceImpl implements MoviesDataSource {
  final ApiService _apiService;
  MoviesDataSourceImpl(this._apiService);
  @override
  Future<MoviesModel> getMoviesByCategory({
    required String category,
    required int page,
  }) async {
    return await _apiService.getMoviesByCategory(
      category: category,
      page: page,
    );
  }

  @override
  Future<MoviesModel> getRandomeMovies({required int page}) async {
    return await _apiService.getRandomeMovies(page: page);
  }

  @override
  Future<MovieCastModel> getMovieCast({required int movieId}) async {
    return await _apiService.getMovieCast(movieId: movieId);
  }

  @override
  Future<MovieDetailsModel> getMovieDetails({required int movieId}) async {
    return await _apiService.getMovieDetails(movieId: movieId);
  }

  @override
  Future<MovieReviewsModel> getMovieReviews({required int movieId}) async {
    return await _apiService.getMovieReviews(movieId: movieId);
  }
}
