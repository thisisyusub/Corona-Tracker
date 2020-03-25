import 'package:corona_news/data/models/news.dart';
import 'dart:convert' show json;

import 'package:corona_news/data/services/api_service.dart';

class NewsDataProvider {
  Future<List<News>> fetchNewsData() async {
    final String url = 'https://covid-az.herokuapp.com/api/news';

    try {
      final result = await ApiService().client.get(url, headers: {
        'Content-type': 'application/json',
      });

      if (result.statusCode == 200) {
        List<News> news = [];
        final convertedData = json.decode(result.body) as List<dynamic>;

        convertedData
            .forEach((currentNews) => news.add(News.fromJson(currentNews)));

        return news;
      }
    } catch (e) {
      print(e);
    }
    return [];
  }
}
