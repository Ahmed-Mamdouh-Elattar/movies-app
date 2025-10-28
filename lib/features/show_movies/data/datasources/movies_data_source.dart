import 'package:movies_app/features/show_movies/data/datasources/api_service.dart';
import 'package:movies_app/features/show_movies/data/models/movie_cast_model/movie_cast_model.dart';
import 'package:movies_app/features/show_movies/data/models/movie_details_model/movie_details_model.dart';
import 'package:movies_app/features/show_movies/data/models/movie_reviews_model/movie_reviews_model.dart';
import 'package:movies_app/features/show_movies/data/models/movies_model/movies_model.dart';

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
    try {
      return await _apiService.getMoviesByCategory(
        category: category,
        page: page,
      );
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<MoviesModel> getRandomeMovies({required int page}) async {
    try {
      return await _apiService.getRandomeMovies(page: page);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<MovieCastModel> getMovieCast({required int movieId}) async {
    try {
      return await _apiService.getMovieCast(movieId: movieId);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails({required int movieId}) async {
    try {
      return await _apiService.getMovieDetails(movieId: movieId);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<MovieReviewsModel> getMovieReviews({required int movieId}) async {
    try {
      return await _apiService.getMovieReviews(movieId: movieId);
    } on Exception {
      rethrow;
    }
  }
}
