import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/core/helper/constants.dart';
import 'package:movies_app/core/services/shared_preferences/shared_preferences_service.dart';
import 'package:movies_app/core/utils/response_result.dart';
import 'package:movies_app/features/watch_list/domain/entities/movie_watch_list_entity.dart';
import 'package:movies_app/features/watch_list/domain/usecases/get_movies_watch_list_use_case.dart';

part 'watch_list_state.dart';
part 'watch_list_cubit.freezed.dart';

class WatchListCubit extends Cubit<WatchListState> {
  WatchListCubit(this._getMoviesWatchListUseCase)
    : super(const WatchListState.initial());
  final GetMoviesWatchListUseCase _getMoviesWatchListUseCase;

  Future<void> addOrDeleteMovieToWatchList(String movieId) async {
    final moviesWatchList = await SharedPreferencesService.getList(
      key: kWatchListKey,
    );
    if (moviesWatchList.contains(movieId)) {
      moviesWatchList.remove(movieId);

      await SharedPreferencesService.setList(
        key: kWatchListKey,
        value: moviesWatchList,
      );
    } else {
      moviesWatchList.add(movieId);
      await SharedPreferencesService.setList(
        key: kWatchListKey,
        value: moviesWatchList,
      );
    }
    await isMovieExistedInWatchList(movieId);
  }

  Future<void> isMovieExistedInWatchList(String movieId) async {
    final moviesWatchList = await SharedPreferencesService.getList(
      key: kWatchListKey,
    );
    if (moviesWatchList.contains(movieId)) {
      emit(const WatchListState.addOrDeleteMovieSuccess(isExisted: true));
    } else {
      emit(const WatchListState.addOrDeleteMovieSuccess(isExisted: false));
    }
  }

  Future<void> getWatchListMovies() async {
    emit(const WatchListState.loading());
    final result = await _getMoviesWatchListUseCase();
    result.when(
      success: (movies) {
        emit(WatchListState.success(movies: movies));
      },
      failure: (failure) {
        emit(WatchListState.failure(errMessage: failure.errMessage));
      },
    );
  }
}
