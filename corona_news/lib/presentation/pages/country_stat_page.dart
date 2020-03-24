import 'package:corona_news/data/models/country.dart';
import 'package:corona_news/presentation/widgets/country_item.dart';
import 'package:flutter/material.dart';

class CountryStatPage extends StatelessWidget {
  final List<Country> countries;

  CountryStatPage(this.countries) : assert(countries != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Scrollbar(
                  child: ListView.builder(
                      itemBuilder: (context, index) => CountryItem(
                            countries[index],
                          )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
