import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfo {
  final Connectivity _connectivity = Connectivity();
  final StreamController<bool> _connectionController =
      StreamController<bool>.broadcast();

  Stream<bool> get connectionStream => _connectionController.stream;

  NetworkInfo() {
    _connectivity.onConnectivityChanged.listen((result) {
      final isConnected = result[0] != ConnectivityResult.none;
      _connectionController.add(isConnected);
    });
  }

  Future<bool> get isConnected async {
    final result = await _connectivity.checkConnectivity();
    return result[0] != ConnectivityResult.none;
  }

  void dispose() {
    _connectionController.close();
  }
}
