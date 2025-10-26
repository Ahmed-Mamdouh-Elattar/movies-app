import 'package:movies_app/features/show_movies/data/datasources/api_service.dart';
import 'package:movies_app/features/show_movies/data/models/movies_model/movies_model.dart';

abstract class MoviesDataSource {
  Future<MoviesModel> getMoviesByCategory({
    required String category,
    required int page,
  });
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
}
