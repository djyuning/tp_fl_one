import 'package:flutter/material.dart';

class ThemePage extends StatefulWidget {
  @override
  _ThemePageState createState() => new _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Theme'),
      ),
      body: new SingleChildScrollView(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Image.asset('images/demo2.jpg'),
            new Image.asset('images/demo2.jpg'),
          ],
        ),
      ),
    );
  }
}
