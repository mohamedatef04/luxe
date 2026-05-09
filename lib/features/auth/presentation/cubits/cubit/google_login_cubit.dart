import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:luxe/core/utils/safe_emit.dart';
import 'package:luxe/features/auth/data/models/login_response_model.dart';
import 'package:luxe/features/auth/data/repos/auth_repo.dart';

part 'google_login_state.dart';

class GoogleLoginCubit extends Cubit<GoogleLoginState> {
  GoogleLoginCubit(this.authRepo) : super(GoogleLoginInitial());
  final AuthRepo authRepo;

  final _googleSignIn = GoogleSignIn(
    // Web Client ID from Google Console (NOT the Android one)
    serverClientId:
        '490782673728-5o966k305aivr5ujbclnnj9d00na77tn.apps.googleusercontent.com',
  );

  Future<void> signInWithGoogle() async {
    safeEmit(GoogleLoginLoading());
    try {
      // 1. Open the Google account picker
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // User cancelled the sign-in
        safeEmit(
          const GoogleLoginFailure(errorMessage: 'Google sign in cancelled'),
        );
        return;
      }
      // 2. Get the ID token from Google
      final googleAuth = await googleUser.authentication;
      final idToken = googleAuth.idToken;

      if (idToken == null) {
        safeEmit(
          const GoogleLoginFailure(errorMessage: 'Could not retrieve ID token'),
        );
        return;
      }
      // 3. Send idToken to your backend
      final result = await authRepo.googleSignIn(idToken: idToken);
      result.fold(
        (failure) =>
            safeEmit(GoogleLoginFailure(errorMessage: failure.errorMessage)),
        (response) =>
            safeEmit(GoogleLoginSuccess(loginResponseModel: response)),
      );
    } catch (e) {
      safeEmit(GoogleLoginFailure(errorMessage: e.toString()));
    }
  }
}
