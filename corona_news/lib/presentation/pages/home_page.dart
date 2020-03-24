import 'package:corona_news/blocs/covid_bloc/covid_bloc.dart';
import 'package:corona_news/blocs/covid_bloc/covid_event.dart';
import 'package:corona_news/blocs/covid_bloc/covid_state.dart';
import 'package:corona_news/data/models/country.dart';
import 'package:corona_news/presentation/pages/country_stat_page.dart';
import 'package:corona_news/presentation/pages/info_page.dart';
import 'package:corona_news/presentation/widgets/active_cases.dart';
import 'package:corona_news/presentation/widgets/country_item.dart';
import 'package:corona_news/presentation/widgets/world_rate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.bloc<CovidBloc>().add(AppStarted());

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<CovidBloc, CovidState>(
          builder: (context, covidState) {
            if (covidState is CovidInProgress) {
              return Center(child: CircularProgressIndicator());
            }

            if (covidState is CovidLoadFailure) {
              return Center(child: Text(covidState.message));
            }

            CovidLoadSuccess successState = covidState as CovidLoadSuccess;
            return _buildSuccessWidget(context, successState.azerbaijanData);
          },
        ),
      ),
    );
  }

  Widget _buildSuccessWidget(BuildContext context, Country country) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.format_list_bulleted,
                          color: Colors.grey[500]),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: context.bloc<CovidBloc>(),
                            child: CountryStatPage(),
                          ),
                        ));
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.info, color: Colors.grey[500]),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => InfoPage(),
                        ));
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              CountryItem(
                Country(
                  name: 'Azərbaycan',
                  totalCases: country.totalCases,
                  newCases:
                      country.newCases.isEmpty ? 'Yoxdur' : country.newCases,
                  totalDeaths: country.totalDeaths,
                  newDeaths:
                      country.newDeaths.isEmpty ? 'Yoxdur' : country.newDeaths,
                  totalRecovered: country.totalRecovered,
                ),
              ),
              WorldRate(),
              SizedBox(height: 10),
              CustomCases(
                title: 'Aktiv hallar',
                subtitle: 'Hal-hazırda yoluxmuş xəstələr',
                value: '0',
                firstProgressTitle: 'Vəziyyəti mülayim',
                secondProgressTitle: 'Vəziyyəti ağır',
                firstProgressValue: '0',
                secondProgressValue: '0',
                firstProgressPercentage: 0,
                secondProgressPercentage: 0,
                fistProgressColor: Colors.blueAccent,
                secondProgressColor: Colors.orangeAccent,
              ),
              SizedBox(
                height: 15,
              ),
              CustomCases(
                title: 'Bağlı hallar',
                subtitle: 'Nəticəsi məlum olan hallar',
                value: '0',
                firstProgressTitle: 'Sağalma',
                secondProgressTitle: 'Ölüm',
                firstProgressValue: '0',
                secondProgressValue: '0',
                firstProgressPercentage: 0,
                secondProgressPercentage: 0,
                fistProgressColor: Colors.greenAccent,
                secondProgressColor: Colors.redAccent,
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
