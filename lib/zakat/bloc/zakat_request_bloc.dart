import 'package:bloc/bloc.dart';
import 'package:zakat_frontend/data/repository/zakat_request_repository.dart';
import '../../data/model/zakat_request.dart';


part 'zakat_request_event.dart';
part 'zakat_request_state.dart';

class ZakatRequestBloc extends Bloc<ZakatRequestEvent, ZakatRequestState> {
  final zakatRequestRepo = ZakatRequestRepoSitory();

  ZakatRequestBloc() : super(LoadingZakatRequestState());
  @override
  Stream<ZakatRequestState> mapEventToState(ZakatRequestEvent event) async* {
    if (event is LoadZakatRequestEvent ||
        event is PullToRefreshZakatRequestEvent) {
      print("initial Loading");
      yield LoadingZakatRequestState();
    }
    try {
      print("Calling for request");
      final zakatRequests = await zakatRequestRepo.getAllZakatRequest();
      yield LoadedZakatRequestState(zakatRequests: zakatRequests);
    } on Error catch (error) {
      yield FailedToLoadZakatRequestState(error: error);
    }
  }
}
