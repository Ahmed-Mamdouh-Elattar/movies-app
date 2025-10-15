import 'package:movies_app/core/utils/result.dart';

abstract class PhoneAuthRepo {
  Future<Result<String>> sendCode(String phoneNumber);
  Future<Result<String>> verifyCode(String verificationId, String smsCode);
}
