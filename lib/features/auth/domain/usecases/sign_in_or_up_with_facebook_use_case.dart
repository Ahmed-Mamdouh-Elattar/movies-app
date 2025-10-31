import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/core/utils/response_result.dart';
import 'package:movies_app/features/auth/domain/repositories/social_auth_repo.dart';

class SignInOrUpWithFacebookUseCase {
  final SocialAuthRepo _authRepo;

  SignInOrUpWithFacebookUseCase(this._authRepo);

  Future<ResponseResult<UserCredential>> call() async {
    return await _authRepo.signInOrUp();
  }
}
