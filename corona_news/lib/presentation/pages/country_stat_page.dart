import 'package:corona_news/blocs/covid_bloc/covid_bloc.dart';
import 'package:corona_news/data/models/country.dart';
import 'package:corona_news/presentation/widgets/country_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryStatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final countries = BlocProvider.of<CovidBloc>(context).countries;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        brightness: Brightness.dark,
        title: Text(
          'Ölkələr',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CountrySearch(),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Scrollbar(
                child: ListView.builder(
                  itemBuilder: (context, index) => CountryItem(
                    countries[index],
                  ),
                  itemCount: countries.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CountrySearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for app bar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on selection
    return CountryItem(Country(
      name: 'Test',
      newCases: '0',
      newDeaths: '0',
      totalCases: '0',
      totalDeaths: '0',
      totalRecovered: '0',
    ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    return ListView.builder(
      itemBuilder: (context, i) => ListTile(
        onTap: () => showResults(context),
        title: Text('$i test'),
      ),
      itemCount: 5,
    );
  }
}
