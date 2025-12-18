import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_app/core/models/movies_model/movies_model.dart';
import 'package:movies_app/features/search/data/datasources/search_data_source.dart';

import 'search_repo_impl_test.mocks.dart';

@GenerateMocks([SearchDataSource])
void main() {
  const page = 1;
  const query = "query";
  final cancelToken = CancelToken();
  late SearchDataSource apiService;
  setUp(() {
    apiService = MockSearchDataSource();
  });

  group("test search repo impl", () {
    group("searchMovies()", () {
      test(
        "should return movies model when call to search data source is successful",
        () async {
          //arrange
          final expectedMoviesModel = MoviesModel(
            page: page,
            results: [],
            totalPages: 1,
            totalResults: 1,
          );
          when(
            apiService.searchMovies(
              query: query,
              page: page,
              cancelToken: cancelToken,
            ),
          ).thenAnswer((_) async => expectedMoviesModel);
          //act
          final result = await apiService.searchMovies(
            query: query,
            page: page,
            cancelToken: cancelToken,
          );
          //assert
          expect(result, expectedMoviesModel);
        },
      );
      test(
        "should throw exception when call to search data source fails",
        () async {
          //arrange
          when(
            apiService.searchMovies(
              query: query,
              page: page,
              cancelToken: cancelToken,
            ),
          ).thenThrow(Exception());
          //act
          Future<MoviesModel> result() async => await apiService.searchMovies(
            query: query,
            page: page,
            cancelToken: cancelToken,
          );
          //assert
          expect(result(), throwsException);
        },
      );
    });
  });
}
