part of 'random_movies_cubit.dart';

@freezed
class RandomMoviesState with _$RandomMoviesState {
  const factory RandomMoviesState.initial() = Initial;
  const factory RandomMoviesState.loading() = Loading;
  const factory RandomMoviesState.loaded(List<MoviesEntity> movies) = Loaded;
  const factory RandomMoviesState.failure(String errMessage) = Failure;
  const factory RandomMoviesState.loadingMore() = LoadingMore;
}
