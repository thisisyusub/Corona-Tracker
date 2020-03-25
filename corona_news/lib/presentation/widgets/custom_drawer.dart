import 'package:corona_news/blocs/article_bloc/article_bloc.dart';
import 'package:corona_news/blocs/article_bloc/article_event.dart';
import 'package:corona_news/data/data_providers/articles_data_provider.dart';
import 'package:corona_news/data/repositories/article_repository.dart';
import 'package:corona_news/presentation/pages/article_page.dart';
import 'package:corona_news/presentation/pages/country_stat_page.dart';
import 'package:corona_news/presentation/pages/news_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: Container(
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Text(
                  'Evdə Qal',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
          ListTile(
            title: Text('Ölkələr'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => CountryStatPage()));
            },
            trailing: Icon(Icons.format_list_bulleted),
          ),
          Divider(
            height: 0,
          ),
          RepositoryProvider(
            create: (_) => ArticleRepository(new ArticlesDataProvider()),
            child: Builder(
              builder: (context) => BlocProvider(
                create: (_) =>
                    ArticleBloc(context.repository<ArticleRepository>()),
                child: Builder(
                  builder: (context) => ListTile(
                    title: Text('Koronavirus haqqında'),
                    onTap: () {
                      context.bloc<ArticleBloc>().add(ArticlePageOpenClicked());
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: context.bloc<ArticleBloc>(),
                            child: ArticlePage(),
                          ),
                        ),
                      );
                    },
                    trailing: Icon(Icons.info),
                  ),
                ),
              ),
            ),
          ),
          Divider(
            height: 0,
          ),
          ListTile(
            title: Text('Xəbərlər'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => NewsPage()));
            },
            trailing: Icon(Icons.new_releases),
          ),
        ],
      ),
    );
  }
}
