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
                delegate: CountrySearch(countries),
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
  final List<Country> countries;

  CountrySearch(this.countries) : assert(countries != null);

  @override
  String get searchFieldLabel => 'Axtar';

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
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      primaryColor: Colors.deepPurple,
      primaryColorBrightness: Brightness.dark,
      textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white),
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.white)),
    );
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
    final resultCountries =
        countries.where((country) => country.name.startsWith(query)).toList();

    return resultCountries.isEmpty
        ? Center(
            child: Text('Heç bir ölkə tapılmadı :('),
          )
        : SingleChildScrollView(
            child: Column(
              children: resultCountries
                  .map(
                    (country) => CountryItem(country),
                  )
                  .toList(),
            ),
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show suggestions when someone searches for something
    final List<Country> suggestedCountries = query.isEmpty
        ? countries
        : countries.where((country) => country.name.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, i) => ListTile(
        onTap: () {
          query = suggestedCountries[i].name;
          showResults(context);
        },
        title: RichText(
          text: TextSpan(
              text: suggestedCountries[i].name.substring(0, query.length),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: suggestedCountries[i].name.substring(query.length),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ]),
        ),
      ),
      itemCount: suggestedCountries.length,
    );
  }
}
