import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuth _auth;

  AuthRepoImpl(this._auth);

  @override
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
