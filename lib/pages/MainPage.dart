import 'package:flutter/material.dart';

import './HomePage.dart';
import './WorksPage.dart';
import './ServicePage.dart';
import './ThemePage.dart';

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
  ];

  var _body = [
    new HomePage(),
    new WorksPage(),
    new ServicePage(),
    new ThemePage(),
  ];

  var _pageController = new PageController(
    initialPage: 0,
  );

  void _pageChange(int index) {
    setState(() {
      if (_tabIndex != index) {
        _tabIndex = index;
      }
      print(_tabIndex);
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
        key: new Key('MainPageView'),
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
        ],
        onTap: (index) {
          setState(() {
            _tabIndex = index;
            _pageChange(index);
          });
        },
      ),
      drawer: new Drawer(
        key: new Key('DrawerMain'),
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              currentAccountPicture: new GestureDetector(
                onTap: () => print('current user'),
                child: new CircleAvatar(
                  backgroundImage: new AssetImage('images/demo2.jpg'),
                ),
              ),
              accountName: new Text('User Name'),
              accountEmail: new Text('email@example.com'),
              margin: EdgeInsets.all(0.0),
              onDetailsPressed: () {
                print('12312');
              },
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new AssetImage('images/drawerBg.jpg'),
                ),
              ),
            ),
            new ListTile(
              key: new Key('DrawerMenuOne'),
              leading: new Icon(
                Icons.tag_faces,
                color: Colors.red,
              ),
              title: new Text('激活会员'),
              onTap: () {
                Navigator.of(context).popAndPushNamed('themePage');
              },
            ),
            new ListTile(
              key: new Key('DrawerMenuTwo'),
              leading: new Icon(
                Icons.account_balance_wallet,
                color: Colors.red,
              ),
              title: new Text('钱包'),
              onTap: () {},
            ),
            new ListTile(
              key: new Key('DrawerMenuThree'),
              leading: new Icon(
                Icons.palette,
                color: Colors.red,
              ),
              title: new Text('个性装扮'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
