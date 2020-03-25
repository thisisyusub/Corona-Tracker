import 'package:corona_news/blocs/covid_bloc/covid_bloc.dart';
import 'package:corona_news/blocs/covid_bloc/covid_event.dart';
import 'package:corona_news/data/data_providers/country_data_provider.dart';
import 'package:corona_news/data/data_providers/global_statistics_data_provider.dart';
import 'package:corona_news/data/repositories/covid_repository.dart';
import 'package:corona_news/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.purple[700], // status bar color
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
  ));

  runApp(
    RepositoryProvider(
      create: (_) => CovidRepository(
          new CountryDataProvider(), new GlobalStatisticsDataProvider()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              CovidBloc(RepositoryProvider.of<CovidRepository>(context))
                ..add(AppStarted()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.purple[700],
          accentColor: Colors.purple[500],
          primaryColorBrightness: Brightness.light,
          scaffoldBackgroundColor: Colors.white,
          splashColor: Colors.purple[200],
        ),
        home: HomePage(),
      ),
    );
  }
}
