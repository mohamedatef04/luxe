import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:luxe/core/utils/safe_emit.dart';
import 'package:luxe/features/auth/data/repos/auth_repo.dart';

part 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  VerifyOtpCubit(this.authRepo) : super(VerifyOtpInitial());

  final AuthRepo authRepo;
  Future<void> verifyOtp({
    required String email,
    required String otp,
  }) async {
    safeEmit(VerifyOtpLoading());
    final result = await authRepo.verifyOtp(email: email, otp: otp);
    result.fold(
      (failure) =>
          safeEmit(VerifyOtpFailure(errorMessage: failure.errorMessage)),
      (success) => safeEmit(VerifyOtpSuccess()),
    );
  }
}
