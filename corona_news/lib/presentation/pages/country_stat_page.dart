import 'package:corona_news/blocs/covid_bloc/covid_bloc.dart';
import 'package:corona_news/blocs/covid_bloc/covid_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryStatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<CovidBloc, CovidState>(
          builder: (context, state) {
            if (state is CovidInProgress) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is CovidLoadFailure) {
              return Center(
                child: Text(state.message),
              );
            }

            return Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Axtar',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Expanded(
                  child: Scrollbar(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
