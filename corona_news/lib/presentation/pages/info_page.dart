import 'package:corona_news/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Koronavirus',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              _infoExpansionTile('Covid-19 nədir?', AppStrings.whatIsCovid19),
              _infoExpansionTile(
                  'Covid-19 xəstəliyi', AppStrings.covid19Disease),
              _infoExpansionTile('Virusun yayılması', AppStrings.spreadOfVirus),
              _infoExpansionTile('Bir şəxsdən digərinə birbaşa yoluxması',
                  AppStrings.fromPersonToOther),
              _infoExpansionTile(
                  'Xəstə olmayan bir şəxs virusun daşıyıcısı olub onu yaya bilərmi?',
                  AppStrings.nonDiseasePerson),
              _infoExpansionTile(
                  'Virusun olduğu səthlər və əşyalarla kontakt nəticəsində yoluxma',
                  AppStrings.objectSpread),
              _infoExpansionTile(
                  'Virus hansı asanlıqla yayılır?', AppStrings.easySpread),
              _infoExpansionTile('Peyvənd', AppStrings.vaccine),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoExpansionTile(String title, String content) {
    return ExpansionTile(
      title: Text(title),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            content,
            textAlign: TextAlign.justify,
          ),
        )
      ],
    );
  }
}
