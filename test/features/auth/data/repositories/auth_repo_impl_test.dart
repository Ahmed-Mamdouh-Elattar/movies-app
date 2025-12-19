import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_app/features/auth/data/repositories/auth_repo_impl.dart';

import '../../../../core/mocks/firebase_auth/firebase_auth.mocks.dart';
import 'auth_repo_impl_test.mocks.dart';

@GenerateMocks([User])
void main() {
  late AuthRepoImpl authRepoImpl;
  late MockFirebaseAuth mockFirebaseAuth;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    authRepoImpl = AuthRepoImpl(mockFirebaseAuth);
  });
  group('testing AuthRepoImpl', () {
    test('should return authStateChanges stream when called', () {
      //arrange
      final user = MockUser();
      when(
        mockFirebaseAuth.authStateChanges(),
      ).thenAnswer((_) => Stream.value(user));

      //assert
      expectLater(authRepoImpl.authStateChanges, emits(user));
    });
    test('should signOut successfully when called', () {
      //arrange
      when(mockFirebaseAuth.signOut()).thenAnswer((_) => Future.value());
      //act
      authRepoImpl.signOut();
      //assert
      verify(mockFirebaseAuth.signOut()).called(1);
      verifyNoMoreInteractions(mockFirebaseAuth);
    });
  });
}
