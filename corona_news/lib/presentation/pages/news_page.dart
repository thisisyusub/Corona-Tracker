import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Xəbərlər',
          style: TextStyle(color: Colors.white),
        ),
        brightness: Brightness.dark,
        iconTheme: IconThemeData(color: Colors.white),
      ),
    );
  }
}
