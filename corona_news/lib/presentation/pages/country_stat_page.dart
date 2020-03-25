import 'package:corona_news/blocs/covid_bloc/covid_bloc.dart';
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
        title: Text(
          'Ölkələr',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Scrollbar(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                    itemBuilder: (context, index) => CountryItem(
                      countries[index],
                    ),
                    itemCount: countries.length,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
