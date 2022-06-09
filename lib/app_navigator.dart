import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zakat_frontend/auth/auth_cubit.dart';
import 'package:zakat_frontend/auth/auth_navigator.dart';
import 'package:zakat_frontend/home_page.dart';
import 'package:zakat_frontend/data/model/zakat_request.dart';
import 'package:zakat_frontend/post/posts_view.dart';
import 'package:zakat_frontend/session/session_cubit.dart';
import 'package:zakat_frontend/session/session_state.dart';
import 'package:zakat_frontend/zakat/zakat_request_view.dart';

import 'loading_view.dart';

class AppNavigator extends StatelessWidget {
  // const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionCubit, SessionState>(builder: (context, state) {
      return Navigator(
        pages: [
          if (state is UnknownSessionState) MaterialPage(child: LoadingView()),

          if(state is Unauthenticated)
          MaterialPage(
            child: BlocProvider(
              create: (context) =>
                    AuthCubit(sessionCubit: context.read<SessionCubit>()),
              child: const AuthNavigator(),)
          ),

          if(state is Authenticated) MaterialPage(child: ZakatRequestView())
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
