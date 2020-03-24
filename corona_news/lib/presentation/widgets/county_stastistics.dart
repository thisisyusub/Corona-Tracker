import 'package:corona_news/data/models/country.dart';
import 'package:flutter/material.dart';

class CountryStatistics extends StatelessWidget {
  final List<Country> countries;

  CountryStatistics(this.countries);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(countries[0].name),
    );
  }
}

/*
DataTable(
        columns: [
          DataColumn(label: Text('Ölkə')),
          DataColumn(label: Text('Xəstələr'), numeric: true),
          DataColumn(label: Text('Yeni Xəstələr'), numeric: true),
          DataColumn(label: Text('Ölüm'), numeric: true),
          DataColumn(label: Text('Yeni Ölüm'), numeric: true),
          DataColumn(label: Text('Sağalıb'), numeric: true),
        ],
        rows: countries
            .map(
              (country) => DataRow(cells: [
                DataCell(Text(country.name)),
                DataCell(Text(country.totalCases)),
                DataCell(Text(country.newCases)),
                DataCell(Text(country.totalDeaths)),
                DataCell(Text(country.newDeaths)),
                DataCell(Text(country.totalRecovered)),
              ]),
            )
            .toList(),
      ),
*/
