import 'package:movies_app/features/auth/domain/repositories/auth_repo.dart';

class SignOutUseCase {
  final AuthRepo _authRepo;
  SignOutUseCase(this._authRepo);

  Future<void> call() async {
    await _authRepo.signOut();
  }
}
