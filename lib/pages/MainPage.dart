import 'package:flutter/material.dart';

import './HomePage.dart';
import './WorksPage.dart';
import './ServerPage.dart';
import './SettingPage.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _tabIndex = 0;

  PageController _controller;

  List<Text> _title = <Text>[
    new Text('主页'),
    new Text('作品'),
    new Text('服务'),
    new Text('设置'),
  ];

  List<Widget> _body = <Widget>[
    HomePage(),
    WorksPage(),
    ServerPage(),
    SettingPage(),
  ];

  void onPageChanged(int index) {
    setState(() {
      if (_tabIndex != index) {
        _tabIndex = index;
      }
      _controller.jumpToPage(index);
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = new PageController(initialPage: this._tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new PageView(
        physics: new NeverScrollableScrollPhysics(),
        children: _body,
        controller: _controller,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: _tabIndex,
        type: BottomNavigationBarType.fixed,
        onTap: onPageChanged,
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: _title[0],
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.rss_feed),
            title: _title[1],
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.local_offer),
            title: _title[2],
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.explore),
            title: _title[3],
          ),
        ],
      ),
    );
  }
}
