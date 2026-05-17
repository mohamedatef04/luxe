import 'package:equatable/equatable.dart';

class LoginResponseModel extends Equatable {
  final String? accessToken;
  final String? refreshToken;
  final String? expiresAtUtc;

  const LoginResponseModel({
    this.accessToken,
    this.refreshToken,
    this.expiresAtUtc,
  });
  @override
  List<Object?> get props => [
    accessToken,
    refreshToken,
    expiresAtUtc,
  ];

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      accessToken: json['accessToken'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
      expiresAtUtc: json['expiresAtUtc'] ?? '',
    );
  }
}
