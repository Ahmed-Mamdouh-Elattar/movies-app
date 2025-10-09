import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/core/utils/result.dart';
import 'package:movies_app/features/auth/domain/usecases/sign_in_or_up_with_facebook_use_case.dart';
import 'package:movies_app/features/auth/domain/usecases/sign_in_or_up_with_google_use_case.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._signInOrUpWithGoogle, this._signInOrUpWithFacebook)
    : super(const AuthState.initial());
  final SignInOrUpWithGoogleUseCase _signInOrUpWithGoogle;
  final SignInOrUpWithFacebookUseCase _signInOrUpWithFacebook;

  Future<void> signInOrUpWithGoogle() async {
    emit(const AuthState.loading());

    final user = await _signInOrUpWithGoogle.call();
    switch (user) {
      case ResultSuccess(:final data):
        emit(AuthState.success(data));
        break;
      case ResultFailure(:final message):
        emit(AuthState.failure(message));
        break;
    }
  }

  Future<void> signInOrUpWithFacebook() async {
    emit(const AuthState.loading());

    final user = await _signInOrUpWithFacebook.call();
    switch (user) {
      case ResultSuccess(:final data):
        emit(AuthState.success(data));
        break;
      case ResultFailure(:final message):
        emit(AuthState.failure(message));
        break;
    }
  }
}
