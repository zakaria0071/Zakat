import 'package:bloc/bloc.dart';
import 'package:zakat_frontend/auth/auth_credentials.dart';
import 'package:zakat_frontend/auth/auth_cubit.dart';
import 'package:zakat_frontend/auth/auth_repository.dart';
import 'package:zakat_frontend/auth/form_submission_status.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepo;
  final AuthCubit authCubit;

  LoginBloc({required this.authRepo, required this.authCubit}) : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginUsernameChanged) {
      yield state.copyWith(username: event.username);
    } else if (event is LoginPasswordChanged) {
      yield state.copyWith(password: event.password);
    } else if (event is LoginSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());
      try {
        print("username ${state.username},Password: ${state.password} ");

        var refreshToken = await authRepo.login(username: state.username, password: state.password);
        authCubit.launchSession(AuthCredentials(refreshToken: refreshToken));
        
        yield state.copyWith(formStatus: SubmissionSuccess());
      } on Exception catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(exception: e));
      }
    }
  }

  // LoginBloc() : super(LoginState()) {
  //   on<LoginEvent>((event, emit) {
  //     // TODO: implement event handler
  //   });
  // }
}
