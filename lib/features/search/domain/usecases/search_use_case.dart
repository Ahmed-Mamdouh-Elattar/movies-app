import 'package:movies_app/core/utils/response_result.dart';
import 'package:movies_app/features/search/domain/entities/search_movies_entity.dart';
import 'package:movies_app/features/search/domain/repositories/search_repo.dart';

class SearchUseCase {
  final SearchRepo _searchRepo;
  SearchUseCase(this._searchRepo);
  Future<ResponseResult<List<SearchMoviesEntity>>> call({
    required String query,
    required int page,
  }) async {
    return await _searchRepo.searchMovies(query: query, page: page);
  }
}
