import 'package:corona_news/data/models/country.dart';
import 'package:equatable/equatable.dart';

abstract class CovidState extends Equatable {
  const CovidState();
}

class CovidInitial extends CovidState {
  @override
  List<Object> get props => null;
}

class CovidInProgress extends CovidState {
  @override
  List<Object> get props => null;
}

class CovidLoadFailure extends CovidState {
  final String message;

  CovidLoadFailure(this.message);

  @override
  List<Object> get props => [message];
}

class CovidLoadSuccess extends CovidState {
  final Country azerbaijanData;

  CovidLoadSuccess(this.azerbaijanData);

  @override
  List<Object> get props => [azerbaijanData];
}
