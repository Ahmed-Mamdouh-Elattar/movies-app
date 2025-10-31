import 'package:movies_app/core/utils/response_result.dart';
import 'package:movies_app/features/auth/domain/repositories/phone_auth_repo.dart';

class VerifyCodeUseCase {
  final PhoneAuthRepo _phoneAuthRepo;
  VerifyCodeUseCase(this._phoneAuthRepo);

  Future<ResponseResult<String>> call(
    String verificationId,
    String smsCode,
  ) async {
    return await _phoneAuthRepo.verifyCode(verificationId, smsCode);
  }
}
