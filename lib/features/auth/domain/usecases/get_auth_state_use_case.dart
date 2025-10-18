import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/features/auth/domain/repositories/auth_repo.dart';

class GetAuthStateUseCase {
  final AuthRepo _authRepo;

  GetAuthStateUseCase(this._authRepo);

  Stream<User?> call() {
    return _authRepo.authStateChanges;
  }
}
