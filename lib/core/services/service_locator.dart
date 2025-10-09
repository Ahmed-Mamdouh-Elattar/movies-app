import 'package:get_it/get_it.dart';
import 'package:movies_app/features/auth/data/repositories/facebook_auth_repo_impl.dart';
import 'package:movies_app/features/auth/data/repositories/google_auth_repo_imp.dart';
import 'package:movies_app/features/auth/domain/usecases/sign_in_or_up_with_facebook_use_case.dart';
import 'package:movies_app/features/auth/domain/usecases/sign_in_or_up_with_google_use_case.dart';
import 'package:movies_app/features/auth/presentation/cubit/auth_cubit.dart';

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
  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(
      getIt<SignInOrUpWithGoogleUseCase>(),
      getIt<SignInOrUpWithFacebookUseCase>(),
    ),
  );
}
