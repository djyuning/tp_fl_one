import 'package:flutter/material.dart';

class WorksPage extends StatefulWidget {
  @override
  _WorksPageState createState() => new _WorksPageState();
}

class _WorksPageState extends State<WorksPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('作品'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search), onPressed: () => {}),
        ],
      ),
      body: new SingleChildScrollView(
        key: new Key('WorksScroll'),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Image.asset('images/demo2.jpg'),
            new Image.asset('images/drawerBg.jpg'),
            new Image.asset('images/demo2.jpg'),
          ],
        ),
      ),
    );
  }
}
