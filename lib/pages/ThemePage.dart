import 'package:flutter/material.dart';

class ThemePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Theme'),
      ),
      body: new SingleChildScrollView(
        key: new Key('ThemeScroll'),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text('312'),
          ],
        ),
      ),
    );
  }
}
