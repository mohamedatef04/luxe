import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:luxe/core/utils/safe_emit.dart';
import 'package:luxe/features/auth/data/models/login_response_model.dart';
import 'package:luxe/features/auth/data/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;

  Future<void> login({required String email, required String password}) async {
    safeEmit(LoginLoading());
    final result = await authRepo.login(email: email, password: password);
    result.fold(
      (failure) {
        safeEmit(LoginFailure(errorMessage: failure.errorMessage));
      },
      (loginResponseModel) {
        safeEmit(LoginSuccess(loginResponseModel: loginResponseModel));
      },
    );
  }
}
