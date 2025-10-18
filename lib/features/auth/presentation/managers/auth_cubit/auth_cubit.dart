import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/features/auth/domain/usecases/get_auth_state_use_case.dart';
import 'package:movies_app/features/auth/domain/usecases/sign_out_use_case.dart';
part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final GetAuthStateUseCase _getAuthStateUseCase;
  final SignOutUseCase _signOutUseCase;
  late final Stream<User?> _authState;
  late StreamSubscription<User?> _authStateSubscription;

  AuthCubit(this._getAuthStateUseCase, this._signOutUseCase)
    : super(const AuthState.initial());
  Future<void> signOut() async {
    await _signOutUseCase.call();
  }

  void getAuthState() async {
    _authState = _getAuthStateUseCase.call();

    _authStateSubscription = _authState.listen((user) {
      if (user != null) {
        emit(AuthState.authenticated(user));
      } else {
        emit(const AuthState.unauthenticated());
      }
    });
  }

  @override
  Future<void> close() {
    _authStateSubscription.cancel();
    return super.close();
  }
}
