part of 'network_cubit.dart';

@freezed
class NetworkState with _$NetworkState {
  const factory NetworkState.initial() = Initial;
  const factory NetworkState.loading() = Loading;
  const factory NetworkState.connected() = NetWorkConnected;
  const factory NetworkState.disconnected() = NetworkDisconnected;
}
