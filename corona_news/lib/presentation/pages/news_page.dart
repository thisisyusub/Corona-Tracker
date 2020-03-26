import 'package:corona_news/blocs/news_bloc/news_bloc.dart';
import 'package:corona_news/blocs/news_bloc/news_state.dart';
import 'package:corona_news/presentation/widgets/custom_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Xəbərlər',
          style: TextStyle(color: Colors.white),
        ),
        brightness: Brightness.dark,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, newsState) {
            if (newsState is NewsInProgress) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (newsState is NewsLoadFailure) {
              return Center(
                child: Text(newsState.message),
              );
            }

            if (newsState is NewsLoadSuccess) {
              return _buildSuccessWidget(newsState);
            }

            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildSuccessWidget(NewsLoadSuccess newsLoadSuccessState) {
    return SingleChildScrollView(
      child: Column(
        children: newsLoadSuccessState.news
            .map(
              (news) => CustomExpansionTile(
                title: news.title,
                body: news.body,
              ),
            )
            .toList(),
      ),
    );
  }
}
