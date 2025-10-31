import 'package:movies_app/core/utils/response_result.dart';
import 'package:movies_app/features/search/domain/entities/search_movies_entity.dart';

abstract class SearchRepo {
  Future<ResponseResult<List<SearchMoviesEntity>>> searchMovies({
    required String query,
    required int page,
  });
}
