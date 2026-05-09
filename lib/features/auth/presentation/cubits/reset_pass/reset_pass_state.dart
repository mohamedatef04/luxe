part of 'reset_pass_cubit.dart';

sealed class ResetPassState extends Equatable {
  const ResetPassState();

  @override
  List<Object> get props => [];
}

final class ResetPassInitial extends ResetPassState {}

final class ResetPassLoading extends ResetPassState {}

final class ResetPassSuccess extends ResetPassState {}

final class ResetPassError extends ResetPassState {
  final String errorMessage;
  const ResetPassError({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
