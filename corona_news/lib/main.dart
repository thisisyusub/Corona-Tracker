import 'package:corona_news/blocs/covid_bloc/covid_bloc.dart';
import 'package:corona_news/data/data_providers/country_data_provider.dart';
import 'package:corona_news/data/repositories/covid_repository.dart';
import 'package:corona_news/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(
    RepositoryProvider(
      create: (_) => CovidRepository(new CountryDataProvider()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: BlocProvider(
          create: (_) =>
              CovidBloc(RepositoryProvider.of<CovidRepository>(context)),
          child: HomePage()),
    );
  }
}
