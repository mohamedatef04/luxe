part of 'google_login_cubit.dart';

sealed class GoogleLoginState extends Equatable {
  const GoogleLoginState();

  @override
  List<Object> get props => [];
}

final class GoogleLoginInitial extends GoogleLoginState {}

final class GoogleLoginLoading extends GoogleLoginState {}

final class GoogleLoginSuccess extends GoogleLoginState {
  final LoginResponseModel loginResponseModel;
  const GoogleLoginSuccess({required this.loginResponseModel});

  @override
  List<Object> get props => [loginResponseModel];
}

final class GoogleLoginFailure extends GoogleLoginState {
  final String errorMessage;
  const GoogleLoginFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
