import 'package:equatable/equatable.dart';

abstract class CovidEvent extends Equatable {
  const CovidEvent();
}

class AppStarted extends CovidEvent {
  @override
  List<Object> get props => null;
}

class CountryPageOpened extends CovidEvent {
  @override
  List<Object> get props => null;
}
