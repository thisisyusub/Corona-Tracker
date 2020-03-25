import 'package:corona_news/presentation/widgets/title_part.dart';
import 'package:flutter/material.dart';
import 'package:corona_news/presentation/widgets/progress_indicator.dart';

class CustomCases extends StatelessWidget {
  final String title;
  final String subtitle;
  final String value;
  final String firstProgressTitle;
  final String secondProgressTitle;
  final String firstProgressValue;
  final String secondProgressValue;
  final double firstProgressPercentage;
  final double secondProgressPercentage;
  final Color fistProgressColor;
  final Color secondProgressColor;

  CustomCases({
    this.title,
    this.subtitle,
    this.value,
    this.firstProgressTitle,
    this.secondProgressTitle,
    this.firstProgressValue,
    this.secondProgressValue,
    this.firstProgressPercentage,
    this.secondProgressPercentage,
    this.fistProgressColor,
    this.secondProgressColor,
  });

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TitlePart(title),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  value.replaceAll(',', ''),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          CustomProgressIndicator(
            firstTitle: firstProgressTitle,
            secondTitle: secondProgressTitle,
            firstValue: firstProgressValue,
            secondValue: secondProgressValue,
            firstBackgroundColor: fistProgressColor,
            secondBackgroundColor: secondProgressColor,
            firstPercentage: firstProgressPercentage,
            secondPercentage: secondProgressPercentage,
          ),
        ],
      ),
    );
  }
}
