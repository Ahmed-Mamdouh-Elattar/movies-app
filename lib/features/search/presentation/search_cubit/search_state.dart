part of 'search_cubit.dart';

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState.initial() = Initial;
  const factory SearchState.loading() = Loading;
  const factory SearchState.loaded(List<SearchMoviesEntity> movies) = Loaded;
  const factory SearchState.failure(String errMessage) = Failure;
}
