import 'package:flutter/material.dart';

class WorksPage extends StatefulWidget {
  @override
  _WorksPageState createState() => new _WorksPageState();
}

class _WorksPageState extends State<WorksPage>
    with AutomaticKeepAliveClientMixin {
  // 当前实例是否应该保持活动状态
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
