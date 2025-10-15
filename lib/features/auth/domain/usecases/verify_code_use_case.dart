import 'package:movies_app/core/utils/result.dart';
import 'package:movies_app/features/auth/domain/repositories/phone_auth_repo.dart';

class VerifyCodeUseCase {
  final PhoneAuthRepo _phoneAuthRepo;
  VerifyCodeUseCase(this._phoneAuthRepo);

  Future<Result<String>> call(String verificationId, String smsCode) async {
    return await _phoneAuthRepo.verifyCode(verificationId, smsCode);
  }
}
