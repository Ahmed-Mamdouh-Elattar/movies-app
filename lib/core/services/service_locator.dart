import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/core/networking/dio/dio_object.dart';
import 'package:movies_app/core/networking/network_info/network_cubit/network_cubit.dart';
import 'package:movies_app/core/networking/network_info/network_info.dart';
import 'package:movies_app/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:movies_app/features/auth/data/repositories/facebook_auth_repo_impl.dart';
import 'package:movies_app/features/auth/data/repositories/google_auth_repo_imp.dart';
import 'package:movies_app/features/auth/data/repositories/phone_auth_repo_impl.dart';
import 'package:movies_app/features/auth/domain/usecases/get_auth_state_use_case.dart';
import 'package:movies_app/features/auth/domain/usecases/send_code_use_case.dart';
import 'package:movies_app/features/auth/domain/usecases/sign_in_or_up_with_facebook_use_case.dart';
import 'package:movies_app/features/auth/domain/usecases/sign_in_or_up_with_google_use_case.dart';
import 'package:movies_app/features/auth/domain/usecases/sign_out_use_case.dart';
import 'package:movies_app/features/auth/domain/usecases/verify_code_use_case.dart';
import 'package:movies_app/features/auth/presentation/managers/auth_cubit/auth_cubit.dart';
import 'package:movies_app/features/auth/presentation/managers/phone_auth_cubit/phone_auth_cubit.dart';
import 'package:movies_app/features/auth/presentation/managers/social_auth_cubit/social_auth_cubit.dart';
import 'package:movies_app/features/show_movies/data/datasources/api_service.dart';
import 'package:movies_app/features/show_movies/data/datasources/movies_data_source.dart';
import 'package:movies_app/features/show_movies/data/repositories/movies_repo_imp.dart';
import 'package:movies_app/features/show_movies/domain/usecases/get_movies_by_category_use_case.dart';
import 'package:movies_app/features/show_movies/presentation/managers/movies_cubit/movies_cubit.dart';
import 'package:movies_app/features/splash_screen/managers/cubit/splash_cubit.dart';

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
  getIt.registerLazySingleton<AuthRepoImpl>(
    () => AuthRepoImpl(FirebaseAuth.instance),
  );
  getIt.registerLazySingleton<GetAuthStateUseCase>(
    () => GetAuthStateUseCase(getIt<AuthRepoImpl>()),
  );
  getIt.registerLazySingleton<SignOutUseCase>(
    () => SignOutUseCase(getIt<AuthRepoImpl>()),
  );
  getIt.registerFactory(
    () => AuthCubit(getIt<GetAuthStateUseCase>(), getIt<SignOutUseCase>()),
  );
  getIt.registerFactory(() => SplashCubit());
  getIt.registerLazySingleton<Dio>(() => createDio());
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt.get<Dio>()));
  getIt.registerLazySingleton<MoviesDataSourceImpl>(
    () => MoviesDataSourceImpl(getIt.get<ApiService>()),
  );
  getIt.registerLazySingleton<MoviesRepoImp>(
    () => MoviesRepoImp(getIt.get<MoviesDataSourceImpl>()),
  );
  getIt.registerLazySingleton<GetMoviesByCategoryUseCase>(
    () => GetMoviesByCategoryUseCase(getIt.get<MoviesRepoImp>()),
  );
  getIt.registerFactory<MoviesCubit>(
    () => MoviesCubit(getIt.get<GetMoviesByCategoryUseCase>()),
  );
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfo());
  getIt.registerFactory(() => NetworkCubit(getIt.get<NetworkInfo>()));
}
