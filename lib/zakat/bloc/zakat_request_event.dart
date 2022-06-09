part of 'zakat_request_bloc.dart';

abstract class ZakatRequestEvent {}

class LoadZakatRequestEvent extends ZakatRequestEvent{}

class PullToRefreshZakatRequestEvent extends ZakatRequestEvent{}
