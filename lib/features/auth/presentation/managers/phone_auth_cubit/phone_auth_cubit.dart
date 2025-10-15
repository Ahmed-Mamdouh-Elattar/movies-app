import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/core/utils/result.dart';
import 'package:movies_app/features/auth/domain/usecases/send_code_use_case.dart';
import 'package:movies_app/features/auth/domain/usecases/verify_code_use_case.dart';

part 'phone_auth_state.dart';
part 'phone_auth_cubit.freezed.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  final SendCodeUseCase _sendCodeUseCase;
  final VerifyCodeUseCase _verifyCodeUseCase;

  PhoneAuthCubit({
    required SendCodeUseCase sendCodeUseCase,
    required VerifyCodeUseCase verifyCodeUseCase,
  }) : _verifyCodeUseCase = verifyCodeUseCase,
       _sendCodeUseCase = sendCodeUseCase,
       super(const PhoneAuthState.initial());

  Future<void> sendCode(String phoneNumber) async {
    emit(const PhoneAuthState.loading());
    final result = await _sendCodeUseCase.call(phoneNumber);
    switch (result) {
      case ResultSuccess<String>(:final data):
        emit(PhoneAuthState.success(verificationId: data));
      case ResultFailure<String>(:final message):
        emit(PhoneAuthState.failure(message));
    }
  }

  Future<void> verifyCode(String verificationId, String smsCode) async {
    emit(const PhoneAuthState.loading());
    final result = await _verifyCodeUseCase.call(verificationId, smsCode);
    switch (result) {
      case ResultSuccess<String>():
        emit(const PhoneAuthState.success());
      case ResultFailure<String>(:final message):
        emit(PhoneAuthState.failure(message));
    }
  }
}
