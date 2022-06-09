import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zakat_frontend/auth/auth_cubit.dart';
import 'package:zakat_frontend/auth/login/login_view.dart';
import 'package:zakat_frontend/auth/sign_up/sign_up_view.dart';

class AuthNavigator extends StatelessWidget {
  const AuthNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      return Navigator(
        pages: [
          if(state == AuthState.login) MaterialPage(child: LoginView()),
          if(state == AuthState.signUp)MaterialPage(child: SignUpView())
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
