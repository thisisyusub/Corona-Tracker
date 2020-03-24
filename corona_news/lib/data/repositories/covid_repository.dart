import 'package:corona_news/data/data_providers/country_data_provider.dart';
import 'package:corona_news/data/models/country.dart';

class CovidRepository {
  CovidRepository(this.countryDataProvider);

  final CountryDataProvider countryDataProvider;
  List<Country> _countries = [];

  List<Country> get countries => _countries;

  Future<List<Country>> getAllCountries() async {
    _countries = await countryDataProvider.fetchCountryData();
    return _countries;
  }

  Country get getAzerbaijanData =>
      _countries.firstWhere((country) => country.name == 'Azerbaijan');
}
