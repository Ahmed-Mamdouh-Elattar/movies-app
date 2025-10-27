import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/core/utils/result.dart';
import 'package:movies_app/features/show_movies/domain/entities/movies_entity.dart';
import 'package:movies_app/features/show_movies/domain/usecases/get_random_movies_use_case.dart';

part 'random_movies_state.dart';
part 'random_movies_cubit.freezed.dart';

class RandomMoviesCubit extends Cubit<RandomMoviesState> {
  RandomMoviesCubit(this._getRandomMoviesUseCase)
    : super(const RandomMoviesState.initial());
  final GetRandomMoviesUseCase _getRandomMoviesUseCase;
  int _page = 1;

  bool _hasMore = true;
  final List<MoviesEntity> _moveies = [];
  Future<void> getRandomMovies() async {
    if (!_hasMore) {
      return;
    }
    _page == 1
        ? emit(const RandomMoviesState.loading())
        : emit(const RandomMoviesState.loadingMore());

    final result = await _getRandomMoviesUseCase.call(page: _page);
    result.when(
      success: (movies) {
        if (movies.isEmpty) {
          _hasMore = false;
        } else {
          final newMovies = movies.where(
            (movie) => !_moveies.any((oldMovies) => oldMovies.id == movie.id),
          );
          _moveies.addAll(newMovies);
          emit(RandomMoviesState.loaded(_moveies));
        }

        _page++;
      },
      failure: (failure) {
        emit(RandomMoviesState.failure(failure.errMessage));
      },
    );
  }

  void reset() {
    _page = 1;
    _hasMore = true;
    _moveies.clear();
  }
}
