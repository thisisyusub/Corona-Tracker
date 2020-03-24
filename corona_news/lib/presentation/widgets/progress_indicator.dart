import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  final String firstTitle;
  final String secondTitle;
  final String firstValue;
  final String secondValue;
  final double firstPercentage;
  final double secondPercentage;
  final Color firstBackgroundColor;
  final Color secondBackgroundColor;

  CustomProgressIndicator({
    this.firstTitle,
    this.firstValue,
    this.secondTitle,
    this.secondValue,
    this.firstPercentage,
    this.secondPercentage,
    this.firstBackgroundColor,
    this.secondBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.grey[200],
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          _rowItem(firstTitle, firstValue, firstPercentage),
          SizedBox(height: 15),
          LinearProgressIndicator(
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation(firstBackgroundColor),
            value: firstPercentage,
          ),
          SizedBox(height: 20),
          _rowItem(secondTitle, secondValue, secondPercentage),
          SizedBox(height: 15),
          LinearProgressIndicator(
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation(secondBackgroundColor),
            value: secondPercentage,
          ),
        ],
      ),
    );
  }

  Widget _rowItem(String title, String value, double percentage) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(title),
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: value.replaceAll(',', ''),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            TextSpan(
              text: ' (${(percentage * 100).toStringAsFixed(0)}%)',
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
