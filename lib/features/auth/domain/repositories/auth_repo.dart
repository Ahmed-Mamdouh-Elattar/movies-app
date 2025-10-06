import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/core/utils/result.dart';

abstract class AuthRepo {
  Future<Result<UserCredential>> signInOrUp();
}
