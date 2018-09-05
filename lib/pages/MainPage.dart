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
      appBar: new AppBar(
        title: _title[_tabIndex],
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.person), onPressed: () => {}),
          new IconButton(icon: new Icon(Icons.search), onPressed: () => {}),
        ],
      ),
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
