import 'package:flutter/material.dart';
import '../modal/Todo.dart';

class WorkDetailPage extends StatelessWidget {
  final Todo work;

  WorkDetailPage({Key key, @required this.work}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('${work.title}'),
        actions: <Widget>[
          new PopupMenuButton<String>(
              onSelected: (String value) {
                print(value);
              },
              icon: Icon(Icons.share),
              itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                    new PopupMenuItem<String>(
                        value: '选项一的值', child: new Text('微信')),
                    new PopupMenuItem<String>(
                        value: '选项二的值', child: new Text('易信')),
                    new PopupMenuItem<String>(
                        value: '选项二的值', child: new Text('微博')),
                  ]),
        ],
      ),
      body: new SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: new Column(
          children: <Widget>[
            Text('${work.title}'),
            Text('${work.description}'),
          ],
        ),
      ),
    );
  }
}
