import 'package:movies_app/core/utils/response_result.dart';

abstract class PhoneAuthRepo {
  Future<ResponseResult<String>> sendCode(String phoneNumber);
  Future<ResponseResult<String>> verifyCode(
    String verificationId,
    String smsCode,
  );
}
