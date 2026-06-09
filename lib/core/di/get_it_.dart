import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:luxe/core/api/api_service.dart';
import 'package:luxe/features/auth/data/data_source/remote_data_source.dart';
import 'package:luxe/features/auth/data/repos/auth_repo.dart';
import 'package:luxe/features/auth/presentation/cubits/cubit/google_login_cubit.dart';
import 'package:luxe/features/auth/presentation/cubits/reset_pass/reset_pass_cubit.dart';
import 'package:luxe/features/auth/presentation/cubits/verify_otp/verify_otp_cubit.dart';
import 'package:luxe/features/auth/presentation/cubits/forget_pass/forget_pass_cubit.dart';
import 'package:luxe/features/auth/presentation/cubits/verify_email/verify_email_cubit.dart';
import 'package:luxe/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:luxe/features/auth/presentation/cubits/register/register_cubit.dart';
import 'package:luxe/features/auth/presentation/cubits/resend_otp/resend_otp_cubit.dart';
import 'package:luxe/features/explore/data/data_source/explore_data_source.dart';
import 'package:luxe/features/explore/data/repos/explore_repo.dart';
import 'package:luxe/features/explore/presentation/cubits/cubit/get_categories_cubit.dart';
import 'package:luxe/features/home/data/data_source/home_data_source.dart';
import 'package:luxe/features/home/data/repos/home_repo.dart';
import 'package:luxe/features/home/presentation/cubits/get_offers_cubit/get_offers_cubit.dart';
import 'package:luxe/features/home/presentation/cubits/get_products_cubit/get_products_cubit.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerFactory(() => ApiService(Dio()));

  getIt.registerFactory(
    () => AuthDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerFactory(
    () => AuthRepo(authDataSource: getIt<AuthDataSourceImpl>()),
  );
  getIt.registerLazySingleton(
    () => RegisterCubit(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton(
    () => LoginCubit(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton(
    () => VerifyEmailCubit(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton(
    () => ResendOtpCubit(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton(
    () => ForgetPassCubit(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton(
    () => VerifyOtpCubit(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton(
    () => ResetPassCubit(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton(
    () => GoogleLoginCubit(getIt<AuthRepo>()),
  );

  //Home
  getIt.registerFactory(
    () => HomeDataSourceImpl(getIt<ApiService>()),
  );
  getIt.registerFactory(
    () => HomeRepo(getIt<HomeDataSourceImpl>()),
  );
  getIt.registerLazySingleton(
    () => GetProductsCubit(getIt<HomeRepo>()),
  );
  getIt.registerLazySingleton(
    () => GetOffersCubit(getIt<HomeRepo>()),
  );

  //Explore
  getIt.registerFactory(
    () => ExploreDataSourceImpl(getIt<ApiService>()),
  );
  getIt.registerFactory(
    () => ExploreRepo(getIt<ExploreDataSourceImpl>()),
  );
  getIt.registerLazySingleton(
    () => GetCategoriesCubit(getIt<ExploreRepo>()),
  );
}
