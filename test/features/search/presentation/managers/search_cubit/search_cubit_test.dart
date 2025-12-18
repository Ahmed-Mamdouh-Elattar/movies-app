import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/core/utils/response_result.dart';
import 'package:movies_app/features/search/domain/entities/search_movies_entity.dart';
import 'package:movies_app/features/search/domain/usecases/search_use_case.dart';
import 'package:movies_app/features/search/presentation/managers/search_cubit/search_cubit.dart';
import 'package:fake_async/fake_async.dart';
import 'search_cubit_test.mocks.dart';

@GenerateMocks([SearchUseCase])
void main() {
  final searchMoviesEntity = SearchMoviesEntity(
    id: 1,
    poster: "poster",
    rating: 5,
    title: "title",
    releaseDate: "releaseDate",
  );
  const query = "query";
  late SearchUseCase searchUseCase;
  late SearchCubit searchCubit;
  setUp(() {
    searchUseCase = MockSearchUseCase();
    searchCubit = SearchCubit(searchUseCase);
  });
  tearDown(() {
    searchCubit.close();
  });

  group("test search cubit", () {
    test(
      "should emit initial state when searchMovies is created with page 1",
      () {
        expect(searchCubit.state, const SearchState.initial());
      },
    );
    test("should emit loading then loaded state when search is called", () {
      fakeAsync((async) {
        //arrange
        final expectedStates = [
          const SearchState.loading(),
          SearchState.loaded([searchMoviesEntity]),
        ];
        provideDummy<ResponseResult<List<SearchMoviesEntity>>>(
          ResponseResult.success([searchMoviesEntity]),
        );
        when(
          searchUseCase.call(query: query, page: 1),
        ).thenAnswer((_) async => ResponseResult.success([searchMoviesEntity]));
        //assert
        expectLater(searchCubit.stream, emitsInOrder(expectedStates));
        //act
        searchCubit.searchMovies(query);
        async.elapse(const Duration(milliseconds: 500));
        async.flushMicrotasks();
      });
    });
    test(
      "should emit loadingMore then loaded state when search is called with page > 1",
      () async {
        fakeAsync((async) async {
          //arrange
          final expectedStates = [
            const SearchState.loading(),
            SearchState.loaded([searchMoviesEntity]),
            const SearchState.loadingMore(),
            SearchState.loaded([searchMoviesEntity, searchMoviesEntity]),
          ];
          provideDummy<ResponseResult<List<SearchMoviesEntity>>>(
            ResponseResult.success([searchMoviesEntity]),
          );
          when(searchUseCase.call(query: query, page: 1)).thenAnswer(
            (_) async => ResponseResult.success([searchMoviesEntity]),
          );
          when(searchUseCase.call(query: query, page: 2)).thenAnswer(
            (_) async => ResponseResult.success([searchMoviesEntity]),
          );
          //assert
          expectLater(searchCubit.stream, emitsInOrder(expectedStates));
          //act
          searchCubit.searchMovies(query);
          async.elapse(const Duration(milliseconds: 500));
          async.flushMicrotasks();
          searchCubit.searchMovies(query);
          async.elapse(const Duration(milliseconds: 500));
          async.flushMicrotasks();
        });
      },
    );
    test("should emit failure state when search fails", () {
      //arrange
      final expectedStates = [
        const SearchState.loading(),
        const SearchState.failure("error"),
      ];
      provideDummy<ResponseResult<List<SearchMoviesEntity>>>(
        const ResponseResult.failure(Failures(errMessage: "error")),
      );
      when(searchUseCase.call(query: query, page: 1)).thenAnswer(
        (_) async =>
            const ResponseResult.failure(Failures(errMessage: "error")),
      );
      //assert
      expectLater(searchCubit.stream, emitsInOrder(expectedStates));
      //act
      searchCubit.searchMovies(query);
    });
  });
}
