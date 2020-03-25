import 'package:corona_news/blocs/news_bloc/news_event.dart';
import 'package:corona_news/blocs/news_bloc/news_state.dart';
import 'package:corona_news/data/repositories/news_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc(this.newsRepository) : assert(newsRepository != null);

  final NewsRepository newsRepository;

  @override
  NewsState get initialState => NewsInitial();

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is NewsPageOpenClicked) {
      try {
        yield NewsInProgress();
        await newsRepository.getAllNews();
        yield NewsLoadSuccess(newsRepository.news);
      } catch (e) {
        yield NewsLoadFailure(e.toString());
      }
    }
  }
}
