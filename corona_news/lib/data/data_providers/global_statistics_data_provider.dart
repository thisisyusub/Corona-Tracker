import 'dart:convert' show json;
import 'package:corona_news/data/models/stat.dart';
import 'package:corona_news/data/services/api_service.dart';

class GlobalStatisticsDataProvider {
  Future<Stat> fetchGlobalStatisticsData() async {
    final String url = 'https://covid-az.herokuapp.com/api/stats';

    try {
      final result = await ApiService().client.get(url);

      if (result.statusCode == 200) {
        final convertedData = json.decode(result.body);

        return Stat.fromJson(convertedData);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
