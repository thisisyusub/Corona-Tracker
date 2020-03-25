import 'package:corona_news/data/models/article.dart';
import 'package:equatable/equatable.dart';

abstract class ArticleState extends Equatable {
  const ArticleState();
}

class ArticleInitial extends ArticleState {
  @override
  List<Object> get props => [];
}

class ArticlesInProgress extends ArticleState {
  @override
  List<Object> get props => [];
}

class ArticlesLoadSuccess extends ArticleState {
  final List<Article> articles;

  ArticlesLoadSuccess(this.articles) : assert(articles != null);

  @override
  List<Object> get props => [articles];
}

class ArticlesLoadFailure extends ArticleState {
  final String message;

  ArticlesLoadFailure(this.message) : assert(message != null);

  @override
  List<Object> get props => [message];
}
