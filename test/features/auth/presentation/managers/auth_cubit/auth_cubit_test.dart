import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_app/features/auth/domain/usecases/get_auth_state_use_case.dart';
import 'package:movies_app/features/auth/domain/usecases/sign_out_use_case.dart';
import 'package:movies_app/features/auth/presentation/managers/auth_cubit/auth_cubit.dart';

import '../../../../../core/mocks/user/user.mocks.dart';
import 'auth_cubit_test.mocks.dart';

@GenerateMocks([SignOutUseCase, GetAuthStateUseCase])
void main() {
  late SignOutUseCase signOutUseCase;
  late GetAuthStateUseCase getAuthStateUseCase;
  late AuthCubit authCubit;

  setUp(() {
    signOutUseCase = MockSignOutUseCase();
    getAuthStateUseCase = MockGetAuthStateUseCase();
    authCubit = AuthCubit(getAuthStateUseCase, signOutUseCase);
  });

  group("AuthCubit", () {
    test('initial state should be AuthState.initial', () {
      expect(authCubit.state, const AuthState.initial());
    });
    test("should became AuthState.initial when signOutUseCase called", () {
      //arrange
      when(signOutUseCase.call()).thenAnswer((_) async => Future.value(null));

      //act
      authCubit.signOut();

      //assert
      expect(authCubit.state, const AuthState.initial());
    });
    test(
      "should emit AuthState.authenticated when getAuthStateUseCase emits a user",
      () {
        //arrange
        final user = MockUser();
        when(getAuthStateUseCase.call()).thenAnswer((_) => Stream.value(user));

        //act
        authCubit.getAuthState();

        //assert
        expectLater(authCubit.stream, emits(AuthState.authenticated(user)));
      },
    );
    test(
      "should emit AuthState.unauthenticated when getAuthStateUseCase emits null",
      () {
        //arrange
        when(getAuthStateUseCase.call()).thenAnswer((_) => Stream.value(null));

        //act
        authCubit.getAuthState();

        //assert
        expectLater(authCubit.stream, emits(const AuthState.unauthenticated()));
      },
    );
  });
}
