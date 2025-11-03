import 'package:dio/dio.dart';
import 'package:movies_app/core/models/movies_model/movies_model.dart';
import 'package:movies_app/core/services/api/api_service.dart';

abstract class SearchDataSource {
  Future<MoviesModel> searchMovies({
    required String query,
    required int page,
    required CancelToken cancelToken,
  });
}

class SearchDataSourceImpl implements SearchDataSource {
  final ApiService _apiService;
  SearchDataSourceImpl(this._apiService);
  @override
  Future<MoviesModel> searchMovies({
    required String query,
    required int page,
    required CancelToken cancelToken,
  }) async {
    return await _apiService.searchMovies(
      query: query,
      page: page,
      cancelToken: cancelToken,
    );
  }
}
