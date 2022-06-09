part of 'zakat_in_islam_bloc.dart';

abstract class ZakatInIslamState {}

class ZakatInIslamLoadingState extends ZakatInIslamState {}

class ZakatInIslamLoadedState extends ZakatInIslamState {
  List<ZakatInIslam> zakatInIslam;
  ZakatInIslamLoadedState({
    required this.zakatInIslam,
  });
}

class ZakatInIslamFailedToLoadState extends ZakatInIslamState {
  Error error;
  ZakatInIslamFailedToLoadState({
    required this.error,
  });
}