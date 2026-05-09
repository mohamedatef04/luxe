class LoginResponseModel {
  final String? accessToken;
  final String? refreshToken;
  final String? expiresAtUtc;

  LoginResponseModel({
    this.accessToken,
    this.refreshToken,
    this.expiresAtUtc,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      accessToken: json['accessToken'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
      expiresAtUtc: json['expiresAtUtc'] ?? '',
    );
  }
}
