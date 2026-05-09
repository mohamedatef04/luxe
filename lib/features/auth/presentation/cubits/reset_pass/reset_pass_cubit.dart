import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:luxe/core/utils/safe_emit.dart';
import 'package:luxe/features/auth/data/repos/auth_repo.dart';

part 'reset_pass_state.dart';

class ResetPassCubit extends Cubit<ResetPassState> {
  ResetPassCubit(this.authRepo) : super(ResetPassInitial());
  final AuthRepo authRepo;
  Future<void> resetPassword({
    required String email,
    required String newPassword,
    required String otp,
  }) async {
    safeEmit(ResetPassLoading());
    final response = await authRepo.resetPassword(
      email: email,
      newPassword: newPassword,
      otp: otp,
    );
    response.fold(
      (failure) => safeEmit(
        ResetPassError(errorMessage: failure.errorMessage),
      ),
      (success) => safeEmit(ResetPassSuccess()),
    );
  }
}
