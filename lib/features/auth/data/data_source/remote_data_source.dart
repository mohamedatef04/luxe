import 'package:luxe/core/api/api_service.dart';
import 'package:luxe/core/api/endpoints.dart';
import 'package:luxe/features/auth/data/models/login_response_model.dart';

abstract class AuthDataSource {
  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });
  Future<LoginResponseModel> login({
    required String email,
    required String password,
  });
  Future<void> verifyEmail({
    required String email,
    required String otp,
  });
  Future<void> resendOtp({required String email});
  Future<void> forgetPassword({
    required String email,
  });
  Future<void> verifyOtp({
    required String email,
    required String otp,
  });
  Future<void> resetPassword({
    required String email,
    required String newPassword,
    required String otp,
  });
  Future<LoginResponseModel> googleLogin({required String idToken});
}

class AuthDataSourceImpl implements AuthDataSource {
  final ApiService apiService;
  AuthDataSourceImpl({required this.apiService});
  @override
  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    await apiService.postRequest(
      endpoint: Endpoints.register,
      data: {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
      },
    );
  }

  @override
  Future<LoginResponseModel> login({
    required String email,
    required String password,
  }) async {
    final response = await apiService.postRequest(
      endpoint: Endpoints.login,
      data: {
        "email": email,
        "password": password,
      },
    );
    return LoginResponseModel.fromJson(response.data);
  }

  @override
  Future<void> verifyEmail({
    required String email,
    required String otp,
  }) async {
    await apiService.postRequest(
      endpoint: Endpoints.verifyEmail,
      data: {
        "email": email,
        "otp": otp,
      },
    );
  }

  @override
  Future<void> resendOtp({required String email}) async {
    await apiService.postRequest(
      endpoint: Endpoints.resendOtp,
      data: {
        "email": email,
      },
    );
  }

  @override
  Future<void> forgetPassword({required String email}) async {
    await apiService.postRequest(
      endpoint: Endpoints.forgetPassword,
      data: {
        "email": email,
      },
    );
  }

  @override
  Future<void> verifyOtp({
    required String email,
    required String otp,
  }) async {
    await apiService.postRequest(
      endpoint: Endpoints.verifyOtp,
      data: {
        "email": email,
        "otp": otp,
      },
    );
  }

  @override
  Future<void> resetPassword({
    required String email,
    required String newPassword,
    required String otp,
  }) async {
    await apiService.postRequest(
      endpoint: Endpoints.resetPassword,
      data: {
        "email": email,
        "newPassword": newPassword,
        "otp": otp,
      },
    );
  }

  @override
  Future<LoginResponseModel> googleLogin({required String idToken}) async {
    final response = await apiService.postRequest(
      endpoint: Endpoints.googleLogin,
      data: {
        "idToken": idToken,
      },
    );
    return LoginResponseModel.fromJson(response.data);
  }
}
