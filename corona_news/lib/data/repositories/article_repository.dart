import 'package:corona_news/data/data_providers/articles_data_provider.dart';
import 'package:corona_news/data/models/article.dart';

class ArticleRepository {
  ArticleRepository(this.articlesDataProvider)
      : assert(articlesDataProvider != null);

  final ArticlesDataProvider articlesDataProvider;

  List<Article> _articles = [];

  List<Article> get articles => [..._articles];

  Future getAllArticles() async {
    _articles = await articlesDataProvider.fetchArticleData();
  }
}
