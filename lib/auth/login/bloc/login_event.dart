part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginUsernameChanged extends LoginEvent {
  String username;
  LoginUsernameChanged({
    required this.username,
  });
}

class LoginPasswordChanged extends LoginEvent {
  String password;
  LoginPasswordChanged({
    required this.password,
  });
}

class LoginSubmitted extends LoginEvent{}
