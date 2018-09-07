import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../modal/Todo.dart';
import 'WorkDetailPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final List<Todo> todoData = <Todo>[
    Todo('量子力学和广义相对论在相声中的实践和应用', '董建春，李丁'),
    Todo('百鬼夜行', '董建春，李丁'),
    Todo('诗歌和爱情', '董建春，李丁'),
    Todo('聘文书', '董建春，李丁'),
    Todo('炼金术师', '董建春，李丁'),
    Todo('相面', '常宝华 崔进泉'),
    Todo('侯耀文轶事', '常宝华'),
    Todo('趣话真假', '常宝华 赵福玉'),
    Todo('常回家看看', '常宝华 师胜杰'),
  ];

  Widget itemCell(Todo data) {
    return new Column(
      children: <Widget>[
        new ListTile(
          leading: new Icon(Icons.archive),
          title: Text(data.title),
          subtitle: Text(data.description),
          trailing: new Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return new WorkDetailPage(work: data);
            }));
          },
        ),
        new Divider(
          height: 0.0,
        ),
      ],
    );
  }

  Widget carouselItem() {
    return new Container(
      width: MediaQuery.of(context).size.width,
      child: new Image.asset(
        'images/demo2.jpg',
        fit: BoxFit.fill,
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text('欢迎使用APP'),
              content: new Text(
                  '点击按钮的时候没有任何反应，控制台的报错是:\nAnother exception was thrown: Navigator operation requested with a context that does not include a Navigator。大致意思是，context里没有Navigator对象，却做了Navigator相关的操作。有点莫名其妙。'),
              actions: <Widget>[
                new FlatButton(
                  child: new Text('取消'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                new FlatButton(
                  child: new Text('确定'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('首页'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search), onPressed: () => {}),
          new IconButton(
            icon: new Icon(Icons.person),
            onPressed: () => showAlertDialog(context),
          ),
        ],
      ),
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
              child: new CarouselSlider(
                viewportFraction: 0.9,
                items: todoData.map((i) => carouselItem()).toList(),
                height: 240.0,
                autoPlay: true,
              ),
            ),
            new Divider(
              height: 0.0,
            ),
            new Column(
              children: todoData.map((todo) => itemCell(todo)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
