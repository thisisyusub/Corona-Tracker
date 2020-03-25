import 'package:corona_news/blocs/covid_bloc/covid_bloc.dart';
import 'package:corona_news/blocs/covid_bloc/covid_state.dart';
import 'package:corona_news/presentation/widgets/active_cases.dart';
import 'package:corona_news/presentation/widgets/country_item.dart';
import 'package:corona_news/presentation/widgets/custom_drawer.dart';
import 'package:corona_news/presentation/widgets/world_rate_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CovidBloc, CovidState>(
      builder: (context, covidState) {
        if (covidState is CovidInProgress) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        if (covidState is CovidLoadFailure) {
          return Scaffold(body: Center(child: Text(covidState.message)));
        }

        if (covidState is CovidInitial) {
          return Container();
        }

        if (covidState is CovidLoadSuccess) {
          return _buildSuccessWidget(
            context,
            covidState,
          );
        }

        return Container();
      },
    );
  }

  Widget _buildSuccessWidget(
    BuildContext context,
    CovidLoadSuccess covidState,
  ) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          'Statistika',
          style: TextStyle(color: Colors.white),
        ),
        brightness: Brightness.dark,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                CountryItem(covidState.azerbaijanData),
                WorldRateBar(covidState.worldRate),
                SizedBox(height: 10),
                CustomCases(
                  title: 'Aktiv hallar',
                  subtitle: 'Hal-hazırda yoluxmuş xəstələr',
                  value: covidState.activeCases.activeCases.toString(),
                  firstProgressTitle: 'Vəziyyəti mülayim',
                  secondProgressTitle: 'Vəziyyəti ağır',
                  firstProgressValue:
                      covidState.activeCases.mildCases.toString(),
                  secondProgressValue:
                      covidState.activeCases.criticalCases.toString(),
                  firstProgressPercentage:
                      covidState.activeCases.mildPercentage,
                  secondProgressPercentage:
                      covidState.activeCases.cricitalPercentage,
                  fistProgressColor: Colors.blueAccent,
                  secondProgressColor: Colors.orangeAccent,
                ),
                SizedBox(
                  height: 15,
                ),
                CustomCases(
                  title: 'Bağlı hallar',
                  subtitle: 'Nəticəsi məlum olan hallar',
                  value: covidState.closedCases.closedCases.toString(),
                  firstProgressTitle: 'Sağalma',
                  secondProgressTitle: 'Ölüm',
                  firstProgressValue:
                      covidState.closedCases.recovered.toString(),
                  secondProgressValue: covidState.closedCases.deaths.toString(),
                  firstProgressPercentage:
                      covidState.closedCases.recoveredPercentage,
                  secondProgressPercentage:
                      covidState.closedCases.deathPercentage,
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
      ),
    );
  }
}
