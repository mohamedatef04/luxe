import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:luxe/core/utils/safe_emit.dart';
import 'package:luxe/features/auth/data/repos/auth_repo.dart';

part 'resend_otp_state.dart';

class ResendOtpCubit extends Cubit<ResendOtpState> {
  ResendOtpCubit(this.authRepo) : super(ResendOtpInitial());
  final AuthRepo authRepo;

  Future<void> resendOtp({required String email}) async {
    safeEmit(ResendOtpLoading());
    final result = await authRepo.resendOtp(email: email);
    result.fold(
      (failure) => safeEmit(ResendOtpError(errorMessage: failure.errorMessage)),
      (r) => safeEmit(ResendOtpSuccess()),
    );
  }
}
