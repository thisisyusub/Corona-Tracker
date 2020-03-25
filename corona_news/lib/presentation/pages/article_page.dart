import 'package:corona_news/blocs/article_bloc/article_bloc.dart';
import 'package:corona_news/blocs/article_bloc/article_state.dart';
import 'package:corona_news/presentation/widgets/custom_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Koronavirus',
          style: TextStyle(color: Colors.white),
        ),
        brightness: Brightness.dark,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: BlocBuilder<ArticleBloc, ArticleState>(
          builder: (context, articleState) {
            if (articleState is ArticlesInProgress) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (articleState is ArticlesLoadFailure) {
              return Center(
                child: Text(articleState.message),
              );
            }

            if (articleState is ArticlesLoadSuccess) {
              return _buildSuccessWidget(articleState);
            }

            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildSuccessWidget(ArticlesLoadSuccess articlesLoadSuccessState) {
    return SingleChildScrollView(
      child: Column(
        children: articlesLoadSuccessState.articles
            .map(
              (article) => CustomExpansionTile(
                title: article.article[0],
                body: article.article[1],
              ),
            )
            .toList(),
      ),
    );
  }
}
