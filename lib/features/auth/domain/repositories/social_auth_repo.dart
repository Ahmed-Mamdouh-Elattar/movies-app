import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/core/utils/result.dart';

abstract class SocialAuthRepo {
  Future<Result<UserCredential>> signInOrUp();
}
