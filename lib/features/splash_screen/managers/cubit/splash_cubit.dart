import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<bool> {
  SplashCubit() : super(false);
  void splashFinished() {
    emit(true);
  }
}
