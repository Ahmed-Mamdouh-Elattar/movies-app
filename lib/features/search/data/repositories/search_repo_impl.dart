import 'package:dio/dio.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/core/errors/server_failure.dart';
import 'package:movies_app/core/utils/response_result.dart';
import 'package:movies_app/features/search/data/datasources/search_data_source.dart';
import 'package:movies_app/features/search/domain/entities/search_movies_entity.dart';
import 'package:movies_app/features/search/domain/repositories/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final SearchDataSource _searchDataSource;
  SearchRepoImpl(this._searchDataSource);
  CancelToken? _cancelToken;
  void _cancelSearchRequest() {
    if (_cancelToken != null && !_cancelToken!.isCancelled) {
      _cancelToken!.cancel();
    }
  }

  @override
  Future<ResponseResult<List<SearchMoviesEntity>>> searchMovies({
    required String query,
    required int page,
  }) async {
    _cancelSearchRequest();
    _cancelToken = CancelToken();
    try {
      final response = await _searchDataSource.searchMovies(
        query: query,
        page: page,
        cancelToken: _cancelToken!,
      );
      return ResponseResult.success(response.toSearchMoviesEntity());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        return const ResponseResult.success([]);
      } else {
        return ResponseResult.failure(ServerFailure.fromDioError(e));
      }
    } catch (e) {
      return ResponseResult.failure(Failures(errMessage: e.toString()));
    }
  }
}
