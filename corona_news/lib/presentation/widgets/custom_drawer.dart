import 'package:corona_news/blocs/covid_bloc/covid_bloc.dart';
import 'package:corona_news/blocs/covid_bloc/covid_event.dart';
import 'package:corona_news/presentation/pages/country_stat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDrawer extends StatelessWidget {
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
          ListTile(
            title: Text('Koronavirus'),
            onTap: () {},
            trailing: Icon(Icons.info),
          ),
          Divider(
            height: 0,
          ),
          ListTile(
            title: Text('Xəbərlər'),
            onTap: () {},
            trailing: Icon(Icons.new_releases),
          ),
          Spacer(),
          ListTile(
            title: Text('Tətbiqdən çıx'),
            onTap: () {},
            trailing: Icon(Icons.exit_to_app),
          ),
        ],
      ),
    );
  }
}
