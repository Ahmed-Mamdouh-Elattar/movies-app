import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/core/utils/response_result.dart';
import 'package:movies_app/features/show_movies/domain/entities/movies_entity.dart';
import 'package:movies_app/features/show_movies/domain/usecases/get_random_movies_use_case.dart';
import 'package:movies_app/features/show_movies/presentation/managers/random_movies_cubit/random_movies_cubit.dart';

import 'random_movies_cubit_test.mocks.dart';

@GenerateMocks([GetRandomMoviesUseCase])
void main() {
  final MoviesEntity moviesEntity = const MoviesEntity(id: 1, poster: "poster");
  late RandomMoviesCubit randomMoviesCubit;
  late GetRandomMoviesUseCase getRandomMoviesUseCase;

  setUp(() {
    getRandomMoviesUseCase = MockGetRandomMoviesUseCase();
    randomMoviesCubit = RandomMoviesCubit(getRandomMoviesUseCase);
  });
  tearDown(() {
    randomMoviesCubit.close();
  });

  group("testing RandomMoviesCubit", () {
    group("getRandomMovies", () {
      test(
        "should emit loading state  then loaded state when getRandomMovies is called with page 1",
        () {
          //arrange
          final expectedStates = [
            const RandomMoviesState.loading(),
            RandomMoviesState.loaded([moviesEntity]),
          ];
          provideDummy<ResponseResult<List<MoviesEntity>>>(
            ResponseResult.success([moviesEntity]),
          );
          when(
            getRandomMoviesUseCase.call(page: 1),
          ).thenAnswer((_) async => ResponseResult.success([moviesEntity]));
          //assert
          expectLater(randomMoviesCubit.stream, emitsInOrder(expectedStates));
          //act
          randomMoviesCubit.getRandomMovies();
        },
      );
      test(
        "should emit loadingMore state  then loaded state when getRandomMovies is called with page 2",
        () async {
          //arrange
          final expectedStates = [
            const RandomMoviesState.loading(),
            RandomMoviesState.loaded([moviesEntity]),
            const RandomMoviesState.loadingMore(),
            RandomMoviesState.loaded([moviesEntity]),
          ];
          provideDummy<ResponseResult<List<MoviesEntity>>>(
            ResponseResult.success([moviesEntity]),
          );
          when(
            getRandomMoviesUseCase.call(page: 1),
          ).thenAnswer((_) async => ResponseResult.success([moviesEntity]));
          when(
            getRandomMoviesUseCase.call(page: 2),
          ).thenAnswer((_) async => ResponseResult.success([moviesEntity]));
          //assert
          expectLater(randomMoviesCubit.stream, emitsInOrder(expectedStates));
          //act
          await randomMoviesCubit.getRandomMovies();
          await randomMoviesCubit.getRandomMovies();
        },
      );
      test("should emit failure state when getRandomMovies fails", () async {
        //arrange
        final expectedStates = const [
          RandomMoviesState.loading(),
          RandomMoviesState.failure("failure"),
        ];
        provideDummy<ResponseResult<List<MoviesEntity>>>(
          const ResponseResult.failure(Failures(errMessage: "failure")),
        );
        when(getRandomMoviesUseCase.call(page: 1)).thenAnswer(
          (_) async =>
              const ResponseResult.failure(Failures(errMessage: "failure")),
        );

        //assert
        expectLater(randomMoviesCubit.stream, emitsInOrder(expectedStates));
        //act
        await randomMoviesCubit.getRandomMovies();
      });
      test(
        "should emit loading state only when getMoviesByCategory returns empty list",
        () {
          //arrange
          final expectedStates = [const RandomMoviesState.loading()];
          provideDummy<ResponseResult<List<MoviesEntity>>>(
            const ResponseResultSuccess([]),
          );
          when(
            getRandomMoviesUseCase.call(page: 1),
          ).thenAnswer((_) async => const ResponseResultSuccess([]));

          //assert
          expectLater(randomMoviesCubit.stream, emitsInOrder(expectedStates));
          //act
          randomMoviesCubit.getRandomMovies();
        },
      );
    });
    group("reset", () {
      test("should reset state to initial state when reset is called", () {
        //arrange
        final expectedStates = [const RandomMoviesState.initial()];
        //assert
        expectLater(randomMoviesCubit.stream, emitsInOrder(expectedStates));
        //act
        randomMoviesCubit.reset();
      });
    });
  });
}
