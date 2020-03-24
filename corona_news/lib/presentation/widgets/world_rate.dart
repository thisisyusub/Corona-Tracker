import 'package:corona_news/presentation/widgets/title_part.dart';
import 'package:flutter/material.dart';

class WorldRate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                _rowItem('0', 'Yoluxma'),
                _rowItem('0', 'Ölüm'),
                _rowItem('0', 'Sağalma'),
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
            count,
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
