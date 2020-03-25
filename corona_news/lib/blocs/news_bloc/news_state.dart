import 'package:corona_news/data/models/news.dart';
import 'package:equatable/equatable.dart';

abstract class NewsState extends Equatable {
  const NewsState();
}

class NewsInitial extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsInProgress extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsLoadSuccess extends NewsState {
  final List<News> news;

  NewsLoadSuccess(this.news) : assert(news != null);

  @override
  List<Object> get props => [news];
}

class NewsLoadFailure extends NewsState {
  final String message;

  NewsLoadFailure(this.message) : assert(message != null);

  @override
  List<Object> get props => [message];
}
