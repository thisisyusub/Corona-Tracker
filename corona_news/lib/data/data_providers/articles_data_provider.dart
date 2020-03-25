import 'package:corona_news/data/data_providers/api_service.dart';
import 'package:corona_news/data/models/article.dart';
import 'dart:convert' show json, utf8;

class ArticlesDataProvider {
  Future<List<Article>> fetchArticleData() async {
    final String url = 'https://covid-az.herokuapp.com/api/articles';

    try {
      final result = await ApiService().client.get(url, headers: {
        'Content-type': 'application/json',
      });

      if (result.statusCode == 200) {
        List<Article> articles = [];
        final convertedData = json.decode(result.body) as List<dynamic>;

        convertedData.forEach((article) => articles.add(Article(article)));

        return articles;
      }
    } catch (e) {
      print(e);
    }
    return [];
  }
}
