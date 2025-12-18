import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_app/core/errors/server_failure.dart';
import 'package:movies_app/core/models/movies_model/movies_model.dart';
import 'package:movies_app/core/utils/response_result.dart';
import 'package:movies_app/features/search/data/datasources/search_data_source.dart';
import 'package:movies_app/features/search/data/repositories/search_repo_impl.dart';
import 'package:movies_app/features/search/domain/entities/search_movies_entity.dart';

import 'search_repo_impl_test.mocks.dart';

@GenerateMocks([SearchDataSource])
void main() {
  const page = 1;
  const query = "query";
  final cancelToken = CancelToken();
  late SearchDataSource searchDataSource;
  late SearchRepoImpl searchRepoImpl;
  setUp(() {
    searchDataSource = MockSearchDataSource();
    searchRepoImpl = SearchRepoImpl(searchDataSource, () => cancelToken);
  });

  group("test search repo impl", () {
    group("searchMovies()", () {
      test(
        "should return ResponseResult<List<SearchMoviesEntity>> when call to search data source is successful",
        () async {
          //arrange
          final moviesModel = MoviesModel(
            page: page,
            results: [],
            totalPages: 1,
            totalResults: 1,
          );
          when(
            searchDataSource.searchMovies(
              query: query,
              page: page,
              cancelToken: cancelToken,
            ),
          ).thenAnswer((_) async => moviesModel);
          //act
          final result = await searchRepoImpl.searchMovies(
            query: query,
            page: page,
          );
          //assert
          expect(result, isA<ResponseResult<List<SearchMoviesEntity>>>());
        },
      );
      test(
        "should return ResponseResult<List<SearchMoviesEntity>> when call to search data source fails",
        () async {
          //arrange
          final tFailure = DioException(
            requestOptions: RequestOptions(),
            message: "message",
            type: DioExceptionType.connectionError,
          );
          final expectedValue =
              ResponseResult<List<SearchMoviesEntity>>.failure(
                ServerFailure.fromDioError(tFailure),
              );
          when(
            searchDataSource.searchMovies(
              query: query,
              page: page,
              cancelToken: cancelToken,
            ),
          ).thenAnswer((_) async => throw tFailure);
          //act
          final result = await searchRepoImpl.searchMovies(
            query: query,
            page: page,
          );
          //assert
          expect(result, expectedValue);
        },
      );
    });
  });
}
