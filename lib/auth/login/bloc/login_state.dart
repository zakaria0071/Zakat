part of 'login_bloc.dart';

// @immutable
class LoginState {
  final String username;
  get isValidUsername => username.length >= 3;

  final String password;
  get isValidPassword => password.length >= 3;

  final FormSubmissionStatus formStatus;

  LoginState({
    this.username = '',
    this.password = '',
    this.formStatus = const InitialFormStatus(),
  });

  LoginState copyWith({
    String? username,
    String? password,
    FormSubmissionStatus? formStatus}) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus
    );
  }
}
