import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/core/networking/dio/dio_object.dart';
import 'package:movies_app/core/networking/network_info/network_cubit/network_cubit.dart';
import 'package:movies_app/core/networking/network_info/network_info.dart';
import 'package:movies_app/core/services/shared_preferences/shared_preferences_service.dart';
import 'package:movies_app/features/ai_chat/data/datasources/ai_chat_source.dart';
import 'package:movies_app/features/ai_chat/data/repositories/ai_chat_repo_impl.dart';
import 'package:movies_app/features/ai_chat/domain/usecases/get_ai_chat_response_use_case.dart';
import 'package:movies_app/features/ai_chat/presentation/managers/cubit/ai_chat_cubit.dart';
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
import 'package:movies_app/features/search/data/datasources/search_data_source.dart';
import 'package:movies_app/features/search/data/repositories/search_repo_impl.dart';
import 'package:movies_app/features/search/domain/usecases/search_use_case.dart';
import 'package:movies_app/features/search/presentation/managers/search_cubit/search_cubit.dart';
import 'package:movies_app/core/services/api/api_service.dart';
import 'package:movies_app/features/show_movies/data/datasources/movies_data_source.dart';
import 'package:movies_app/features/show_movies/data/repositories/movies_repo_imp.dart';
import 'package:movies_app/features/show_movies/domain/usecases/get_movie_cast_use_case.dart';
import 'package:movies_app/features/show_movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:movies_app/features/show_movies/domain/usecases/get_movie_reviews_use_case.dart';
import 'package:movies_app/features/show_movies/domain/usecases/get_movies_by_category_use_case.dart';
import 'package:movies_app/features/show_movies/domain/usecases/get_random_movies_use_case.dart';
import 'package:movies_app/features/show_movies/presentation/managers/movie_details_cubit/movie_details_cubit.dart';
import 'package:movies_app/features/show_movies/presentation/managers/movies_category_cubit/movies_category_cubit.dart';
import 'package:movies_app/features/show_movies/presentation/managers/random_movies_cubit/random_movies_cubit.dart';
import 'package:movies_app/features/splash_screen/managers/cubit/splash_cubit.dart';
import 'package:movies_app/features/watch_list/data/datasources/watch_list_movies_source.dart';
import 'package:movies_app/features/watch_list/data/repositories/watch_list_repo_impl.dart';
import 'package:movies_app/features/watch_list/domain/usecases/get_movies_watch_list_use_case.dart';
import 'package:movies_app/features/watch_list/presentation/managers/watch_list_cubit/watch_list_cubit.dart';
import 'package:movies_app/features/watch_list/presentation/managers/watch_list_notifier/watch_list_notifier_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
Future<void> setUpServiceLocator() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
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
  getIt.registerLazySingleton<GetRandomMoviesUseCase>(
    () => GetRandomMoviesUseCase(getIt.get<MoviesRepoImp>()),
  );
  getIt.registerFactory<MoviesCategoryCubit>(
    () => MoviesCategoryCubit(getIt.get<GetMoviesByCategoryUseCase>()),
  );
  getIt.registerFactory<RandomMoviesCubit>(
    () => RandomMoviesCubit(getIt.get<GetRandomMoviesUseCase>()),
  );
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfo());
  getIt.registerFactory(() => NetworkCubit(getIt.get<NetworkInfo>()));
  getIt.registerLazySingleton<GetMovieDetailsUseCase>(
    () => GetMovieDetailsUseCase(getIt.get<MoviesRepoImp>()),
  );
  getIt.registerLazySingleton<GetMovieCastUseCase>(
    () => GetMovieCastUseCase(getIt.get<MoviesRepoImp>()),
  );
  getIt.registerLazySingleton<GetMovieReviewsUseCase>(
    () => GetMovieReviewsUseCase(getIt.get<MoviesRepoImp>()),
  );
  getIt.registerFactory<MovieDetailsCubit>(
    () => MovieDetailsCubit(
      getIt.get<GetMovieDetailsUseCase>(),
      getIt.get<GetMovieCastUseCase>(),
      getIt.get<GetMovieReviewsUseCase>(),
    ),
  );

  getIt.registerLazySingleton<SearchDataSourceImpl>(
    () => SearchDataSourceImpl(getIt.get<ApiService>()),
  );
  getIt.registerLazySingleton<SearchRepoImpl>(
    () => SearchRepoImpl(getIt.get<SearchDataSourceImpl>()),
  );
  getIt.registerLazySingleton<SearchUseCase>(
    () => SearchUseCase(getIt.get<SearchRepoImpl>()),
  );
  getIt.registerFactory<SearchCubit>(
    () => SearchCubit(getIt.get<SearchUseCase>()),
  );
  getIt.registerLazySingleton<WatchListMoviesSource>(
    () => WatchListMoviesSource(
      getIt.get<ApiService>(),
      SharedPreferencesService(),
    ),
  );
  getIt.registerLazySingleton<WatchListRepoImpl>(
    () => WatchListRepoImpl(getIt.get<WatchListMoviesSource>()),
  );
  getIt.registerLazySingleton<GetMoviesWatchListUseCase>(
    () => GetMoviesWatchListUseCase(getIt.get<WatchListRepoImpl>()),
  );
  getIt.registerFactory<WatchListCubit>(
    () => WatchListCubit(getIt.get<GetMoviesWatchListUseCase>()),
  );
  getIt.registerFactory<AiChatSourceImpl>(() => AiChatSourceImpl());
  getIt.registerFactory<AiChatRepoImpl>(
    () => AiChatRepoImpl(getIt.get<AiChatSourceImpl>()),
  );
  getIt.registerFactory<GetAiChatResponseUseCase>(
    () => GetAiChatResponseUseCase(getIt.get<AiChatRepoImpl>()),
  );
  getIt.registerFactory<AiChatCubit>(
    () => AiChatCubit(getIt.get<GetAiChatResponseUseCase>()),
  );
  getIt.registerFactory<WatchListNotifierCubit>(() => WatchListNotifierCubit());
}
