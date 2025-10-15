import 'package:get_it/get_it.dart';
import 'package:movies_app/features/auth/data/repositories/facebook_auth_repo_impl.dart';
import 'package:movies_app/features/auth/data/repositories/google_auth_repo_imp.dart';
import 'package:movies_app/features/auth/data/repositories/phone_auth_repo_impl.dart';
import 'package:movies_app/features/auth/domain/usecases/send_code_use_case.dart';
import 'package:movies_app/features/auth/domain/usecases/sign_in_or_up_with_facebook_use_case.dart';
import 'package:movies_app/features/auth/domain/usecases/sign_in_or_up_with_google_use_case.dart';
import 'package:movies_app/features/auth/domain/usecases/verify_code_use_case.dart';
import 'package:movies_app/features/auth/presentation/managers/phone_auth_cubit/phone_auth_cubit.dart';
import 'package:movies_app/features/auth/presentation/managers/social_auth_cubit/social_auth_cubit.dart';

final getIt = GetIt.instance;
void setUpServiceLocator() {
  getIt.registerLazySingleton<GoogleAuthRepoImp>(() => GoogleAuthRepoImp());
  getIt.registerLazySingleton<SignInOrUpWithGoogleUseCase>(
    () => SignInOrUpWithGoogleUseCase(getIt<GoogleAuthRepoImp>()),
  );
  getIt.registerLazySingleton<FacebookAuthRepoImpl>(
    () => FacebookAuthRepoImpl(),
  );
  getIt.registerLazySingleton<SignInOrUpWithFacebookUseCase>(
    () => SignInOrUpWithFacebookUseCase(getIt<FacebookAuthRepoImpl>()),
  );
  getIt.registerFactory<SocialAuthCubit>(
    () => SocialAuthCubit(
      getIt<SignInOrUpWithGoogleUseCase>(),
      getIt<SignInOrUpWithFacebookUseCase>(),
    ),
  );
  getIt.registerLazySingleton<PhoneAuthRepoImpl>(() => PhoneAuthRepoImpl());
  getIt.registerLazySingleton<SendCodeUseCase>(
    () => SendCodeUseCase(getIt<PhoneAuthRepoImpl>()),
  );
  getIt.registerLazySingleton<VerifyCodeUseCase>(
    () => VerifyCodeUseCase(getIt<PhoneAuthRepoImpl>()),
  );
  getIt.registerFactory(
    () => PhoneAuthCubit(
      sendCodeUseCase: getIt<SendCodeUseCase>(),
      verifyCodeUseCase: getIt<VerifyCodeUseCase>(),
    ),
  );
}
