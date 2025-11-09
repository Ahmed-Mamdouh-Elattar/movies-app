import 'package:flutter_bloc/flutter_bloc.dart';

class WatchListNotifierCubit extends Cubit<bool> {
  WatchListNotifierCubit() : super(false);
  void watchListChange() {
    if (state) {
      emit(false);
    }
    emit(true);
  }

  void reset() => emit(false);
}
