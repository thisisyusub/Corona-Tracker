import 'package:corona_news/blocs/covid_bloc/covid_event.dart';
import 'package:corona_news/blocs/covid_bloc/covid_state.dart';
import 'package:corona_news/data/repositories/covid_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CovidBloc extends Bloc<CovidEvent, CovidState> {
  final CovidRepository covidRepository;

  CovidBloc(this.covidRepository) : assert(covidRepository != null);

  @override
  CovidState get initialState => CovidInitial();

  @override
  Stream<CovidState> mapEventToState(CovidEvent event) async* {
    if (event is AppStarted) {
      try {
        yield CovidInProgress();
        await covidRepository.getAllCountries();
        yield CovidLoadSuccess(covidRepository.getAzerbaijanData);
      } catch (error) {
        yield CovidLoadFailure(error);
      }
    }
    // if (event is AppStarted) {
    //   yield CountryDataInProgress();
    //   try {
    //     final result = await covidRepository.getAllCountries();
    //     yield CountryDataLoadSuccess(result);
    //   } catch (error) {
    //     yield CountryDataLoadFailure(error);
    //   }
    // }
  }
}
