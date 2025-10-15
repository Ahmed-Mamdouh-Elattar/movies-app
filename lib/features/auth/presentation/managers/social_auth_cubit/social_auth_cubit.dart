import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/core/utils/result.dart';
import 'package:movies_app/features/auth/domain/usecases/sign_in_or_up_with_facebook_use_case.dart';
import 'package:movies_app/features/auth/domain/usecases/sign_in_or_up_with_google_use_case.dart';

part 'social_auth_state.dart';
part 'social_auth_cubit.freezed.dart';

class SocialAuthCubit extends Cubit<SocialAuthState> {
  SocialAuthCubit(this._signInOrUpWithGoogle, this._signInOrUpWithFacebook)
    : super(const SocialAuthState.initial());
  final SignInOrUpWithGoogleUseCase _signInOrUpWithGoogle;
  final SignInOrUpWithFacebookUseCase _signInOrUpWithFacebook;

  Future<void> signInOrUpWithGoogle() async {
    emit(const SocialAuthState.loading());

    final user = await _signInOrUpWithGoogle.call();
    switch (user) {
      case ResultSuccess(:final data):
        emit(SocialAuthState.success(data));
        break;
      case ResultFailure(:final message):
        emit(SocialAuthState.failure(message));
        break;
    }
  }

  Future<void> signInOrUpWithFacebook() async {
    emit(const SocialAuthState.loading());

    final user = await _signInOrUpWithFacebook.call();
    switch (user) {
      case ResultSuccess(:final data):
        emit(SocialAuthState.success(data));
        break;
      case ResultFailure(:final message):
        emit(SocialAuthState.failure(message));
        break;
    }
  }
}
