import 'package:corona_news/data/models/active_cases.dart';
import 'package:corona_news/data/models/closed_cases.dart';
import 'package:corona_news/data/models/country.dart';
import 'package:corona_news/data/models/world_rate.dart';
import 'package:equatable/equatable.dart';

abstract class CovidState extends Equatable {
  const CovidState();
}

class CovidInitial extends CovidState {
  @override
  List<Object> get props => [];
}

class CovidInProgress extends CovidState {
  @override
  List<Object> get props => [];
}

class CovidLoadFailure extends CovidState {
  final String message;

  CovidLoadFailure(this.message);

  @override
  List<Object> get props => [message];
}

class CovidLoadSuccess extends CovidState {
  final List<Country> countries;
  final Country azerbaijanData;
  final WorldRate worldRate;
  final ActiveCases activeCases;
  final ClosedCases closedCases;

  CovidLoadSuccess(
    this.countries,
    this.azerbaijanData,
    this.worldRate,
    this.activeCases,
    this.closedCases,
  );

  @override
  List<Object> get props => [
        azerbaijanData,
        worldRate,
        activeCases,
        closedCases,
        countries,
      ];
}
