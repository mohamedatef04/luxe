import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:luxe/core/utils/safe_emit.dart';
import 'package:luxe/features/auth/data/repos/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());
  final AuthRepo authRepo;

  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    safeEmit(RegisterLoading());
    final result = await authRepo.register(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );
    result.fold(
      (l) => safeEmit(RegisterFailure(errorMessage: l.errorMessage)),
      (r) => safeEmit(RegisterSuccess()),
    );
  }
}
