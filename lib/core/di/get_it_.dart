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

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerFactory(() => ApiService(Dio()));
  getIt.registerFactory(
    () => RemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerFactory(
    () => AuthRepo(remoteDataSource: getIt<RemoteDataSourceImpl>()),
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
}
