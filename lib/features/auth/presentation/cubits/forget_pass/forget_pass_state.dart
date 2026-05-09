part of 'forget_pass_cubit.dart';

sealed class ForgetPassState extends Equatable {
  const ForgetPassState();

  @override
  List<Object> get props => [];
}

final class ForgetPassInitial extends ForgetPassState {}

class ForgetPassLoading extends ForgetPassState {}

class ForgetPassSuccess extends ForgetPassState {}

class ForgetPassFailure extends ForgetPassState {
  final String errorMessage;
  const ForgetPassFailure({required this.errorMessage});
}
