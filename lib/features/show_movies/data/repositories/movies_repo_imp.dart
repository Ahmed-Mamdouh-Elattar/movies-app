import 'package:dio/dio.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/core/errors/server_failure.dart';
import 'package:movies_app/core/utils/result.dart';
import 'package:movies_app/features/show_movies/data/datasources/movies_data_source.dart';
import 'package:movies_app/features/show_movies/domain/entities/movies_entity.dart';
import 'package:movies_app/features/show_movies/domain/repositories/movies_repo.dart';

class MoviesRepoImp implements MoviesRepo {
  final MoviesDataSource _moviesDataSource;
  MoviesRepoImp(this._moviesDataSource);
  @override
  Future<Result<List<MoviesEntity>>> getMoviesByCategory({
    required String category,
    required int page,
  }) async {
    try {
      final result = await _moviesDataSource.getMoviesByCategory(
        category: category,
        page: page,
      );
      return Result.success(result.toEntity());
    } on DioException catch (e) {
      return Result.failure(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      return Result.failure(Failures(errMessage: e.toString()));
    }
  }
}
