part of 'movies_category_cubit.dart';

@freezed
class MoviesCategoryState with _$MoviesCategoryState {
  const factory MoviesCategoryState.initial() = Initial;
  const factory MoviesCategoryState.loading() = Loading;
  const factory MoviesCategoryState.loadingMore() = LoadingMore;
  const factory MoviesCategoryState.loaded(List<MoviesEntity> movies) = Loaded;
  const factory MoviesCategoryState.failure(String errMessage) = Failure;
}
