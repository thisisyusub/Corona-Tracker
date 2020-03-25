import 'dart:async';

import 'package:corona_news/blocs/covid_bloc/covid_event.dart';
import 'package:corona_news/blocs/covid_bloc/covid_state.dart';
import 'package:corona_news/data/models/active_cases.dart';
import 'package:corona_news/data/models/closed_cases.dart';
import 'package:corona_news/data/models/country.dart';
import 'package:corona_news/data/models/world_rate.dart';
import 'package:corona_news/data/repositories/covid_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CovidBloc extends Bloc<CovidEvent, CovidState> {
  CovidBloc(this.covidRepository) : assert(covidRepository != null);

  final CovidRepository covidRepository;

  List<Country> get countries => covidRepository.countries;

  @override
  CovidState get initialState => CovidInitial();

  @override
  Stream<CovidState> mapEventToState(CovidEvent event) async* {
    if (event is AppStarted) {
      try {
        yield CovidInProgress();
        await covidRepository.getAllData();

        // get Azerbaijan Data
        final azerbaijanData = covidRepository.countries
            .firstWhere((country) => country.name == 'Azerbaijan');

        // get total world Rate for WorldRateBar
        final worldRate = WorldRate(
          cases: covidRepository.globalStat.totalCases,
          deaths: covidRepository.globalStat.totalDeaths,
          recovered: covidRepository.globalStat.totalRecovered,
        );

        // get active cases
        int activeCaseCount = covidRepository.globalStat.activeCases.isEmpty
            ? 0
            : int.tryParse(
                covidRepository.globalStat.activeCases.replaceAll(',', ''));
        int criticCaseCount = covidRepository.globalStat.criticalCases.isEmpty
            ? 0
            : int.tryParse(
                covidRepository.globalStat.criticalCases.replaceAll(',', ''));
        int mildCases = activeCaseCount - criticCaseCount;

        double criticRate = (criticCaseCount / activeCaseCount);
        double mildRate = 1 - criticRate;

        final activeCases = ActiveCases(
          activeCases: activeCaseCount,
          criticalCases: criticCaseCount,
          mildCases: mildCases,
          cricitalPercentage: criticRate,
          mildPercentage: mildRate,
        );

        // get closed cases
        int totalCasesCount = covidRepository.globalStat.totalCases.isEmpty
            ? 0
            : int.tryParse(
                covidRepository.globalStat.totalCases.replaceAll(',', ''));
        int closedCasesCount = totalCasesCount - activeCaseCount;
        int totalRecoveredCount = covidRepository
                .globalStat.totalRecovered.isEmpty
            ? 0
            : int.tryParse(
                covidRepository.globalStat.totalRecovered.replaceAll(',', ''));
        int totalDeathCount = covidRepository.globalStat.totalDeaths.isEmpty
            ? 0
            : int.tryParse(
                covidRepository.globalStat.totalDeaths.replaceAll(',', ''));

        double recoveredRate = (totalRecoveredCount / closedCasesCount);
        double deathRate = 1 - recoveredRate;

        final closedCases = ClosedCases(
          closedCases: closedCasesCount,
          recovered: totalRecoveredCount,
          deaths: totalDeathCount,
          recoveredPercentage: recoveredRate,
          deathPercentage: deathRate,
        );
        // send data to UI
        yield CovidLoadSuccess(
          covidRepository.countries,
          azerbaijanData,
          worldRate,
          activeCases,
          closedCases,
        );
      } catch (error) {
        yield CovidLoadFailure(error.toString());
      }
    }
  }
}
