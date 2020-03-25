import 'package:corona_news/blocs/article_bloc/article_event.dart';
import 'package:corona_news/blocs/article_bloc/article_state.dart';
import 'package:corona_news/data/repositories/article_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc(this.articleRepository) : assert(articleRepository != null);

  final ArticleRepository articleRepository;

  @override
  ArticleState get initialState => ArticleInitial();

  @override
  Stream<ArticleState> mapEventToState(ArticleEvent event) async* {
    if (event is ArticlePageOpenClicked) {
      try {
        yield ArticlesInProgress();
        await articleRepository.getAllArticles();
        yield ArticlesLoadSuccess(articleRepository.articles);
      } catch (e) {
        yield ArticlesLoadFailure(e.toString());
      }
    }
  }
}
