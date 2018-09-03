import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SingleChildScrollView(
        key: new Key('HomeScroll'),
        child: new Column(
          children: <Widget>[
            new Image.asset('images/demo2.jpg'),
          ],
        ),
      ),
    );
  }
}
