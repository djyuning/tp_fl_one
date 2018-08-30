import 'package:flutter/material.dart';

class WorksPage extends StatefulWidget {
  WorksPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WorksPageState createState() => new _WorksPageState();
}

class _WorksPageState extends State<WorksPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SingleChildScrollView(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Image.asset('images/demo2.jpg'),
            new Image.asset('images/demo2.jpg'),
            new Image.asset('images/demo2.jpg'),
            new Image.asset('images/demo2.jpg'),
            new Image.asset('images/demo2.jpg'),
          ],
        ),
      ),
    );
  }
}
