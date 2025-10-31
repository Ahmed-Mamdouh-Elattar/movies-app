import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/core/utils/response_result.dart';

abstract class SocialAuthRepo {
  Future<ResponseResult<UserCredential>> signInOrUp();
}
