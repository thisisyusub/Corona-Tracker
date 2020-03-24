import 'package:corona_news/blocs/covid_bloc/covid_bloc.dart';
import 'package:corona_news/blocs/covid_bloc/covid_event.dart';
import 'package:corona_news/blocs/covid_bloc/covid_state.dart';
import 'package:corona_news/presentation/pages/country_stat_page.dart';
import 'package:corona_news/presentation/pages/info_page.dart';
import 'package:corona_news/presentation/widgets/active_cases.dart';
import 'package:corona_news/presentation/widgets/country_item.dart';
import 'package:corona_news/presentation/widgets/world_rate_bar.dart';
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

            if (covidState is CovidInitial) {
              return Container();
            }

            CovidLoadSuccess successState = covidState as CovidLoadSuccess;
            return _buildSuccessWidget(
              context,
              successState,
            );
          },
        ),
      ),
    );
  }

  Widget _buildSuccessWidget(
    BuildContext context,
    CovidLoadSuccess covidState,
  ) {
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
                            child: CountryStatPage(covidState.countries),
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
              CountryItem(covidState.azerbaijanData),
              WorldRateBar(covidState.worldRate),
              SizedBox(height: 10),
              CustomCases(
                title: 'Aktiv hallar',
                subtitle: 'Hal-hazırda yoluxmuş xəstələr',
                value: covidState.activeCases.activeCases.toString(),
                firstProgressTitle: 'Vəziyyəti mülayim',
                secondProgressTitle: 'Vəziyyəti ağır',
                firstProgressValue: covidState.activeCases.mildCases.toString(),
                secondProgressValue:
                    covidState.activeCases.criticalCases.toString(),
                firstProgressPercentage: covidState.activeCases.mildPercentage,
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
                firstProgressValue: covidState.closedCases.recovered.toString(),
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
    );
  }
}
