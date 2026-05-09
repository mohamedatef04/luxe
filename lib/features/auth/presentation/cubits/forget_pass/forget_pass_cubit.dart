import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:luxe/core/utils/safe_emit.dart';
import 'package:luxe/features/auth/data/repos/auth_repo.dart';

part 'forget_pass_state.dart';

class ForgetPassCubit extends Cubit<ForgetPassState> {
  final AuthRepo authRepo;
  ForgetPassCubit(this.authRepo) : super(ForgetPassInitial());

  Future<void> forgetPassword({
    required String email,
  }) async {
    safeEmit(ForgetPassLoading());
    final result = await authRepo.forgetPassword(email: email);
    result.fold(
      (failure) =>
          safeEmit(ForgetPassFailure(errorMessage: failure.errorMessage)),
      (success) => safeEmit(ForgetPassSuccess()),
    );
  }
}
