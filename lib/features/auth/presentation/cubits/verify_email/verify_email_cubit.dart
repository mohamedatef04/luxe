import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:luxe/core/utils/safe_emit.dart';
import 'package:luxe/features/auth/data/repos/auth_repo.dart';

part 'verify_email_state.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  final AuthRepo authRepo;
  VerifyEmailCubit(this.authRepo) : super(VerifyEmailInitial());

  Future<void> verifyEmail({
    required String email,
    required String otp,
  }) async {
    safeEmit(VerifyEmailLoading());
    final result = await authRepo.verifyEmail(
      email: email,
      otp: otp,
    );
    result.fold(
      (failure) =>
          safeEmit(VerifyEmailFailure(errorMessage: failure.errorMessage)),
      (success) => safeEmit(VerifyEmailSuccess()),
    );
  }
}
