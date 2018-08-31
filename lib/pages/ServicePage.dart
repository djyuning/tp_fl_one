import 'package:flutter/material.dart';
import 'dart:math' show Random;

class ServicePage extends StatefulWidget {
  var names = [
    'Focus',
    'Blue',
    'Flutter',
  ];

  @override
  _ServicePageState createState() => new _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  String name = 'Abc';

  void _nameRandom() {
    setState(() {
      name = widget.names[new Random().nextInt(widget.names.length)];
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
