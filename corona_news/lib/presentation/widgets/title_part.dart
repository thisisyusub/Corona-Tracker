import 'package:flutter/material.dart';

class TitlePart extends StatelessWidget {
  final String title;
  final bool isCentered;

  TitlePart(this.title, [this.isCentered = false]);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(
          color: Colors.grey,
          width: 0.0,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
      ),
      padding: EdgeInsets.all(10),
      width: double.infinity,
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
