import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:luxe/core/errors/failures.dart';
import 'package:luxe/features/auth/data/data_source/remote_data_source.dart';
import 'package:luxe/features/auth/data/models/login_response_model.dart';

class AuthRepo {
  final RemoteDataSource remoteDataSource;
  AuthRepo({required this.remoteDataSource});

  Future<Either<Failures, void>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      await remoteDataSource.register(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      );
      return right(null);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioExeption(e));
    } catch (error) {
      return left(ServerFailure(errorMessage: error.toString()));
    }
  }

  Future<Either<Failures, LoginResponseModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await remoteDataSource.login(
        email: email,
        password: password,
      );
      return right(response);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioExeption(e));
    } catch (error) {
      return left(ServerFailure(errorMessage: error.toString()));
    }
  }

  Future<Either<Failures, void>> verifyEmail({
    required String email,
    required String otp,
  }) async {
    try {
      await remoteDataSource.verifyEmail(
        email: email,
        otp: otp,
      );
      return right(null);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioExeption(e));
    } catch (error) {
      return left(ServerFailure(errorMessage: error.toString()));
    }
  }

  Future<Either<Failures, void>> resendOtp({
    required String email,
  }) async {
    try {
      await remoteDataSource.resendOtp(email: email);
      return right(null);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioExeption(e));
    } catch (error) {
      return left(ServerFailure(errorMessage: error.toString()));
    }
  }

  Future<Either<Failures, void>> forgetPassword({
    required String email,
  }) async {
    try {
      await remoteDataSource.forgetPassword(email: email);
      return right(null);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioExeption(e));
    } catch (error) {
      return left(ServerFailure(errorMessage: error.toString()));
    }
  }

  Future<Either<Failures, void>> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      await remoteDataSource.verifyOtp(email: email, otp: otp);
      return right(null);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioExeption(e));
    } catch (error) {
      return left(ServerFailure(errorMessage: error.toString()));
    }
  }

  Future<Either<Failures, void>> resetPassword({
    required String email,
    required String newPassword,
    required String otp,
  }) async {
    try {
      await remoteDataSource.resetPassword(
        email: email,
        newPassword: newPassword,
        otp: otp,
      );
      return right(null);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioExeption(e));
    } catch (error) {
      return left(ServerFailure(errorMessage: error.toString()));
    }
  }

  Future<Either<Failures, LoginResponseModel>> googleSignIn({
    required String idToken,
  }) async {
    try {
      final response = await remoteDataSource.googleLogin(idToken: idToken);
      return right(response);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioExeption(e));
    } catch (error) {
      return left(ServerFailure(errorMessage: error.toString()));
    }
  }
}
