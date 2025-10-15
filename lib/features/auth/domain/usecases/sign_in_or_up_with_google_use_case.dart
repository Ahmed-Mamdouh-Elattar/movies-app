import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/core/utils/result.dart';
import 'package:movies_app/features/auth/domain/repositories/social_auth_repo.dart';

class SignInOrUpWithGoogleUseCase {
  final SocialAuthRepo _authRepo;

  SignInOrUpWithGoogleUseCase(this._authRepo);

  Future<Result<UserCredential>> call() async {
    return await _authRepo.signInOrUp();
  }
}
