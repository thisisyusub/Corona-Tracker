import 'package:corona_news/data/data_providers/country_data_provider.dart';
import 'package:corona_news/data/data_providers/global_statistics_data_provider.dart';
import 'package:corona_news/data/models/country.dart';
import 'package:corona_news/data/models/stat.dart';

class CovidRepository {
  CovidRepository(this.countryDataProvider, this.globalStatisticsDataProvider)
      : assert(countryDataProvider != null &&
            globalStatisticsDataProvider != null);

  final CountryDataProvider countryDataProvider;
  final GlobalStatisticsDataProvider globalStatisticsDataProvider;
  List<Country> _countries = [];
  Stat _globalStat;

  List<Country> get countries => _countries;
  Stat get globalStat => _globalStat;

  Future getAllData() async {
    _countries = await countryDataProvider.fetchCountryData();
    _globalStat =
        await globalStatisticsDataProvider.fetchGlobalStatisticsData();
  }
}
