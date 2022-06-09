import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zakat_frontend/auth/auth_credentials.dart';
import 'package:zakat_frontend/auth/auth_repository.dart';
import 'package:zakat_frontend/session/session_state.dart';

class SessionCubit extends Cubit<SessionState> {
  AuthRepository authRepo;

  SessionCubit({required this.authRepo}) : super(UnknownSessionState()) {
    attemptAutoLogin();
  }

  void attemptAutoLogin() async {
    try {
      String refreshToken = await authRepo.attemptAutoLogin();
      emit(Authenticated(user: refreshToken));
    } on Exception {
      emit(Unauthenticated());
    }
  }

  void showAuth() => emit(Unauthenticated());
  void showSession(AuthCredentials credentials) {
    final user = credentials.username;
    emit(Authenticated(user: user));
  }

  void signOut() {
    authRepo.signOut();
    emit(Unauthenticated());
  }
}
