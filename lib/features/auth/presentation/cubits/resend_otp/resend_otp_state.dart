part of 'resend_otp_cubit.dart';

sealed class ResendOtpState extends Equatable {
  const ResendOtpState();

  @override
  List<Object> get props => [];
}

final class ResendOtpInitial extends ResendOtpState {}

final class ResendOtpLoading extends ResendOtpState {}

final class ResendOtpSuccess extends ResendOtpState {}

final class ResendOtpError extends ResendOtpState {
  final String errorMessage;
  const ResendOtpError({required this.errorMessage});
}
