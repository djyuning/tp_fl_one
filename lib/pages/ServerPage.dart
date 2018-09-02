import 'package:flutter/material.dart';
import 'dart:math' show Random;

@immutable
class ServerPage extends StatefulWidget {
  @override
  _ServerPageState createState() => new _ServerPageState();
}

class _ServerPageState extends State<ServerPage> {
  String name = 'Abc';

  final List<String> names = <String>[
    'Focus',
    'Blue',
    'Flutter',
  ];

  void _nameRandom() {
    setState(() {
      name = names[new Random().nextInt(names.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text(name),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _nameRandom,
        child: new Icon(Icons.refresh),
      ),
    );
  }
}
