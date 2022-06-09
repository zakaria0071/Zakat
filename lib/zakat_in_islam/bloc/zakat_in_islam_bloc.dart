import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zakat_frontend/data/model/zakat_in_islam.dart';
import 'package:zakat_frontend/zakat_in_islam/zakat_in_islam_repository.dart';

import '../../data/model/zakat_in_islam.dart';

part 'zakat_in_islam_event.dart';
part 'zakat_in_islam_state.dart';

class ZakatInIslamBloc extends Bloc<ZakatInIslamEvent, ZakatInIslamState> {
  ZakatInIslamRepository repository = ZakatInIslamRepository();

  ZakatInIslamBloc() : super(ZakatInIslamLoadingState());

  @override
  Stream<ZakatInIslamState> mapEventToState(ZakatInIslamEvent event) async* {
    if (event is ZakatInIslamLoadingEvent) {
      yield ZakatInIslamLoadingState();
    }

    try {
      List<ZakatInIslam> hadithOfZakatList = await repository.getAllHadith();
      yield ZakatInIslamLoadedState(zakatInIslam: hadithOfZakatList);
    } on Error catch (error) {
      yield ZakatInIslamFailedToLoadState(error: error);
    }
  }
}