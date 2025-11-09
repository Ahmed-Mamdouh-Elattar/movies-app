part of 'watch_list_cubit.dart';

@freezed
abstract class WatchListState with _$WatchListState {
  const factory WatchListState.initial() = Initial;
  const factory WatchListState.loading() = Loading;
  const factory WatchListState.success({
    required List<MovieWatchListEntity> movies,
  }) = Success;
  const factory WatchListState.failure({required String errMessage}) = Failure;
  const factory WatchListState.addOrDeleteMovieSuccess({
    required bool isExisted,
  }) = AddOrDeleteMovieSuccess;
}
