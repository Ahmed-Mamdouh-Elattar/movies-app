import 'package:get_it/get_it.dart';
import 'package:movies_app/features/auth/data/repositories/google_auth_repo_imp.dart';
import 'package:movies_app/features/auth/domain/usecases/sign_in_or_up_with_google_use_case.dart';
import 'package:movies_app/features/auth/presentation/cubit/auth_cubit.dart';

final getIt = GetIt.instance;
void setUpServiceLocator() {
  getIt.registerLazySingleton<GoogleAuthRepoImp>(() => GoogleAuthRepoImp());
  getIt.registerLazySingleton<SignInOrUpWithGoogleUseCase>(
    () => SignInOrUpWithGoogleUseCase(getIt<GoogleAuthRepoImp>()),
  );
  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(getIt<SignInOrUpWithGoogleUseCase>()),
  );
}
