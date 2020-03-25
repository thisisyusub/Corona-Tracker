import 'package:corona_news/data/models/world_rate.dart';
import 'package:corona_news/presentation/widgets/title_part.dart';
import 'package:flutter/material.dart';

class WorldRateBar extends StatelessWidget {
  WorldRateBar(this.worldRate);

  final WorldRate worldRate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TitlePart('Dünya üzrə'),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _rowItem(worldRate.cases, 'Yoluxma'),
                _rowItem(worldRate.deaths, 'Ölüm'),
                _rowItem(worldRate.recovered, 'Sağalma'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _rowItem(String count, String title) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            count.replaceAll(',', ''),
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
