import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/core/utils/response_result.dart';
import 'package:movies_app/features/search/domain/entities/search_movies_entity.dart';
import 'package:movies_app/features/search/domain/usecases/search_use_case.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchUseCase) : super(const SearchState.initial());
  final SearchUseCase _searchUseCase;
  List<SearchMoviesEntity> _movies = [];
  int _currentPage = 1;
  String _lastQuery = '';
  Timer? _debounce;
  Future<void> searchMovies(String query) async {
    _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      if (query.isEmpty) {
        _movies = [];
        _currentPage = 1;
        _lastQuery = '';
        emit(const SearchState.loaded([]));
        return;
      }

      if (query != _lastQuery) {
        _movies = [];
        _currentPage = 1;
      }
      _lastQuery = query;

      _currentPage > 1
          ? emit(const SearchState.loadingMore())
          : emit(const SearchState.loading());
      final result = await _searchUseCase.call(
        query: query,
        page: _currentPage,
      );
      result.when(
        success: (movies) {
          _movies.addAll(movies);
          _currentPage++;
          _currentPage > 1
              ? emit(SearchState.loadedMore(_movies))
              : emit(SearchState.loaded(_movies));
        },
        failure: (error) {
          emit(SearchState.failure(error.errMessage));
        },
      );
    });
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
