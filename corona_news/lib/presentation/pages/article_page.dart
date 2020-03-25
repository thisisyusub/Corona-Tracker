import 'dart:convert';

import 'package:corona_news/blocs/article_bloc/article_bloc.dart';
import 'package:corona_news/blocs/article_bloc/article_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

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
              (article) => _infoExpansionTile(
                article.article[0],
                article.article[1],
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _infoExpansionTile(String title, String content) {
    return ExpansionTile(
      title: Text(utf8.decode(title.runes.toList())),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Html(
            data: utf8.decode(content.runes.toList()),
          ),
        )
      ],
    );
  }
}
