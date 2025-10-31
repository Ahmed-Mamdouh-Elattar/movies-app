import 'package:movies_app/core/utils/response_result.dart';
import 'package:movies_app/features/auth/domain/repositories/phone_auth_repo.dart';

class SendCodeUseCase {
  final PhoneAuthRepo _phoneAuthRepo;
  SendCodeUseCase(this._phoneAuthRepo);

  Future<ResponseResult<String>> call(String phoneNumber) async {
    return await _phoneAuthRepo.sendCode(phoneNumber);
  }
}
