import 'package:corona_news/data/data_providers/news_data_provider.dart';
import 'package:corona_news/data/models/news.dart';

class NewsRepository {
  NewsRepository(this.newsDataProvider) : assert(newsDataProvider != null);

  final NewsDataProvider newsDataProvider;

  List<News> _news = [];

  List<News> get news => [..._news];

  Future getAllNews() async {
    _news = await newsDataProvider.fetchNewsData();
  }
}
