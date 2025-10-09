import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/core/utils/result.dart';
import 'package:movies_app/features/auth/domain/repositories/auth_repo.dart';

class SignInOrUpWithFacebookUseCase {
  final AuthRepo _authRepo;

  SignInOrUpWithFacebookUseCase(this._authRepo);

  Future<Result<UserCredential>> call() async {
    return await _authRepo.signInOrUp();
  }
}
