import 'package:corona_news/data/data_providers/api_service.dart';
import 'package:corona_news/data/models/country.dart';
import 'dart:convert' show json;

class CountryDataProvider {
  Future<List<Country>> fetchCountryData() async {
    final String url = 'https://covid-az.herokuapp.com/api/';

    try {
      final result = await ApiService().client.get(url);

      if (result.statusCode == 200) {
        List<Country> countries;
        final convertedData = json.decode(result.body) as List<dynamic>;

        countries =
            convertedData.map((country) => Country.fromJson(country)).toList();

        return countries;
      }
    } catch (e) {
      print(e);
    }
    return [];
  }
}
