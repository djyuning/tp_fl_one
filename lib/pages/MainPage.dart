import 'package:flutter/material.dart';

import './HomePage.dart';
import './WorksPage.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _tabIndex = 0;

  var _title = [
    new Text('Home'),
    new Text('Works'),
    new Text('Service'),
    new Text('About'),
    new Text('Setting'),
  ];

  static WorksPage wp = new WorksPage();

  var _body = [
    new HomePage(),
    wp,
    new HomePage(),
    wp,
    new HomePage(),
  ];

  var _pageController = new PageController(
    initialPage: 0,
  );

  void _pageChange(int index) {
    setState(() {
      if (_tabIndex != index) {
        _tabIndex = index;
      }
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: _title[_tabIndex],
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.person), onPressed: () => {}),
          new IconButton(icon: new Icon(Icons.search), onPressed: () => {}),
        ],
      ),
      body: new PageView.builder(
        onPageChanged: _pageChange,
        controller: _pageController,
        itemCount: _body.length,
        pageSnapping: false,
        physics: new NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return _body[index];
        },
      ),
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: _tabIndex,
        type: BottomNavigationBarType.fixed,
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
          new BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            title: _title[4],
          ),
        ],
        onTap: (index) {
          setState(() {
            _tabIndex = index;
            _pageChange(index);
          });
        },
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new Image.asset('images/demo2.jpg'),
          ],
        ),
      ),
    );
  }
}
