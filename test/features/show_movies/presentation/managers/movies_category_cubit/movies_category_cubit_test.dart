import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/core/utils/response_result.dart';
import 'package:movies_app/features/show_movies/domain/entities/movies_entity.dart';
import 'package:movies_app/features/show_movies/domain/usecases/get_movies_by_category_use_case.dart';
import 'package:movies_app/features/show_movies/presentation/managers/movies_category_cubit/movies_category_cubit.dart';

import 'movies_category_cubit_test.mocks.dart';

@GenerateMocks([GetMoviesByCategoryUseCase])
void main() {
  const category = "action";
  final moviesEntity = const MoviesEntity(id: 1, poster: "poster");
  late GetMoviesByCategoryUseCase mockGetMoviesByCategoryUseCase;
  late MoviesCategoryCubit moviesCategoryCubit;

  setUp(() {
    mockGetMoviesByCategoryUseCase = MockGetMoviesByCategoryUseCase();
    moviesCategoryCubit = MoviesCategoryCubit(mockGetMoviesByCategoryUseCase);
  });

  tearDown(() {
    moviesCategoryCubit.close();
  });
  group("testing MoviesCategoryCubit", () {
    group("getMoviesByCategory", () {
      test(
        "should emit loading state then loaded state when getMoviesByCategory is called first time",
        () {
          //arrange
          final expectedStates = [
            const MoviesCategoryState.loading(),
            MoviesCategoryState.loaded([moviesEntity]),
          ];
          provideDummy<ResponseResult<List<MoviesEntity>>>(
            ResponseResultSuccess([moviesEntity]),
          );
          when(
            mockGetMoviesByCategoryUseCase.call(category: category, page: 1),
          ).thenAnswer((_) async => ResponseResultSuccess([moviesEntity]));
          //assert
          expectLater(moviesCategoryCubit.stream, emitsInOrder(expectedStates));
          //act
          moviesCategoryCubit.getMoviesByCategory(category: category);
        },
      );
      test(
        "should emit loadingMore then loaded state when getMoviesByCategory is called second time",
        () async {
          //arrange
          final expectedStates = [
            const MoviesCategoryState.loading(),
            MoviesCategoryState.loaded([moviesEntity]),
            const MoviesCategoryState.loadingMore(),
            MoviesCategoryState.loaded([moviesEntity]),
          ];
          provideDummy<ResponseResult<List<MoviesEntity>>>(
            ResponseResultSuccess([moviesEntity]),
          );
          when(
            mockGetMoviesByCategoryUseCase.call(category: category, page: 1),
          ).thenAnswer((_) async => ResponseResultSuccess([moviesEntity]));
          when(
            mockGetMoviesByCategoryUseCase.call(category: category, page: 2),
          ).thenAnswer((_) async => ResponseResultSuccess([moviesEntity]));
          //assert
          expectLater(moviesCategoryCubit.stream, emitsInOrder(expectedStates));
          //act
          await moviesCategoryCubit.getMoviesByCategory(category: category);
          await moviesCategoryCubit.getMoviesByCategory(category: category);
        },
      );
      test("should emit failure state when getMoviesByCategory fails", () {
        //arrange
        final expectedStates = [
          const MoviesCategoryState.loading(),
          const MoviesCategoryState.failure("error"),
        ];
        provideDummy<ResponseResult<List<MoviesEntity>>>(
          const ResponseResultFailure(Failures(errMessage: "error")),
        );
        when(
          mockGetMoviesByCategoryUseCase.call(category: category, page: 1),
        ).thenAnswer(
          (_) async =>
              const ResponseResultFailure(Failures(errMessage: "error")),
        );

        //assert
        expectLater(moviesCategoryCubit.stream, emitsInOrder(expectedStates));
        //act
        moviesCategoryCubit.getMoviesByCategory(category: category);
      });
      test(
        "should emit loading state only when getMoviesByCategory returns empty list",
        () {
          //arrange
          final expectedStates = [const MoviesCategoryState.loading()];
          provideDummy<ResponseResult<List<MoviesEntity>>>(
            const ResponseResultSuccess([]),
          );
          when(
            mockGetMoviesByCategoryUseCase.call(category: category, page: 1),
          ).thenAnswer((_) async => const ResponseResultSuccess([]));

          //assert
          expectLater(moviesCategoryCubit.stream, emitsInOrder(expectedStates));
          //act
          moviesCategoryCubit.getMoviesByCategory(category: category);
        },
      );
    });
    group("reset", () {
      test("should reset state to initial state when reset is called", () {
        //arrange
        final expectedStates = [const MoviesCategoryState.initial()];
        //assert
        expectLater(moviesCategoryCubit.stream, emitsInOrder(expectedStates));
        //act
        moviesCategoryCubit.reset();
      });
    });
  });
}
