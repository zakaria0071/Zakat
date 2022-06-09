part of 'zakat_request_bloc.dart';

abstract class ZakatRequestState {}

class ZakatRequestInitialState extends ZakatRequestState {}

class LoadingZakatRequestState extends ZakatRequestState{}

class LoadedZakatRequestState extends ZakatRequestState {
  List<ZakatRequest> zakatRequests;

  LoadedZakatRequestState({
    required this.zakatRequests,
  });
}

class FailedToLoadZakatRequestState extends ZakatRequestState {
  Error error;

  FailedToLoadZakatRequestState({
    required this.error,
  });
  
}
