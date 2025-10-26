part of 'movies_cubit.dart';

@freezed
class MoviesState with _$MoviesState {
  const factory MoviesState.initial() = Initial;
  const factory MoviesState.loading() = Loading;
  const factory MoviesState.loadingMore() = LoadingMore;
  const factory MoviesState.loaded(List<MoviesEntity> movies) = Loaded;
  const factory MoviesState.failure(String errMessage) = Failure;
}
