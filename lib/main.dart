import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zakat_frontend/app_navigator.dart';
import 'package:zakat_frontend/auth/auth_repository.dart';
import 'package:zakat_frontend/auth/login/login_view.dart';
import 'package:zakat_frontend/home_page.dart';
import 'package:zakat_frontend/session/session_cubit.dart';

import 'auth/front_page.dart';
import 'home_page1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Frontpage(),
      // RepositoryProvider(
      //   create: (context) => AuthRepository(),
      //   child: BlocProvider(
      //     create: (context) =>
      //         SessionCubit(authRepo: context.read<AuthRepository>()),
      //     child: AppNavigator(),
      //   ),
      // ),
    );
  }

  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: RepositoryProvider(
  //       create: (context) => AuthRepository(),
  //       child: BlocProvider(
  //         create: (context)=>
  //         SessionCubit(authRepo: context.read<AuthRepository>()),
  //           child: AppNavigator(),)
  //       )
  //   );
  // }
}