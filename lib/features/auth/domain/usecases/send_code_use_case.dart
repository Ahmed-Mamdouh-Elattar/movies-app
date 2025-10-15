import 'package:movies_app/core/utils/result.dart';
import 'package:movies_app/features/auth/domain/repositories/phone_auth_repo.dart';

class SendCodeUseCase {
  final PhoneAuthRepo _phoneAuthRepo;
  SendCodeUseCase(this._phoneAuthRepo);

  Future<Result<String>> call(String phoneNumber) async {
    return await _phoneAuthRepo.sendCode(phoneNumber);
  }
}
