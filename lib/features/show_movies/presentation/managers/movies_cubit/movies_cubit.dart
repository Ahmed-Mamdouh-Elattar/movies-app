import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/core/utils/result.dart';
import 'package:movies_app/features/show_movies/domain/entities/movies_entity.dart';
import 'package:movies_app/features/show_movies/domain/usecases/get_movies_by_category_use_case.dart';

part 'movies_state.dart';
part 'movies_cubit.freezed.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit(this._getMoviesByCategoryUseCase)
    : super(const MoviesState.initial());
  final GetMoviesByCategoryUseCase _getMoviesByCategoryUseCase;
  int _page = 1;

  bool _hasMore = true;
  final List<MoviesEntity> _moveies = [];

  Future<void> getMoviesByCategory({required String category}) async {
    if (!_hasMore) {
      return;
    }
    _page == 1
        ? emit(const MoviesState.loading())
        : emit(const MoviesState.loadingMore());

    final result = await _getMoviesByCategoryUseCase.call(
      category: category,
      page: _page,
    );
    result.when(
      success: (movies) {
        if (movies.isEmpty) {
          _hasMore = false;
        } else {
          final newMovies = movies
              .where(
                (movie) =>
                    !_moveies.any((oldMovies) => oldMovies.id == movie.id),
              )
              .toList();
          _moveies.addAll(newMovies);
          emit(MoviesState.loaded(_moveies));
        }

        _page++;
      },
      failure: (failure) {
        emit(MoviesState.failure(failure.errMessage));
      },
    );
  }
}
