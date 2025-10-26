import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/core/networking/network_info/network_info.dart';

part 'network_state.dart';
part 'network_cubit.freezed.dart';

class NetworkCubit extends Cubit<NetworkState> {
  final NetworkInfo _networkInfo;
  late final StreamSubscription _subscription;

  NetworkCubit(this._networkInfo) : super(const NetworkState.initial()) {
    _init();
  }

  void _init() async {
    _subscription = _networkInfo.connectionStream.listen((isConnected) {
      if (isConnected) {
        emit(const NetworkState.connected());
      } else {
        emit(const NetworkState.disconnected());
      }
    });
  }

  Future<void> checkConnection() async {
    emit(const NetworkState.loading());

    final connected = await _networkInfo.isConnected;
    emit(
      connected
          ? const NetworkState.connected()
          : const NetworkState.disconnected(),
    );
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    _networkInfo.dispose();
    return super.close();
  }
}
