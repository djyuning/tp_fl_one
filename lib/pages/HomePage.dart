import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../modal/Todo.dart';
import 'WorkDetailPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Todo> todoData = <Todo>[
    Todo('量子力学和广义相对论在相声中的实践和应用', '董建春，李丁'),
    Todo('百鬼夜行', '董建春，李丁'),
    Todo('诗歌和爱情', '董建春，李丁'),
    Todo('聘文书', '董建春，李丁'),
  ];

  List<Widget> _list = <Widget>[];

  Widget itemCell(Todo data) {
    return new Column(
      children: <Widget>[
        new ListTile(
          leading: new Icon(
            Icons.desktop_mac,
            color: Colors.orange,
          ),
          title: Text(data.title),
          subtitle: Text(data.description),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return new WorkDetailPage(work: data);
            }));
          },
        ),
        //new Divider(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_list.length == 0) {
      for (var item in todoData) {
        _list.add(itemCell(item));
      }
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('首页'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search), onPressed: () => {}),
          new IconButton(icon: new Icon(Icons.person), onPressed: () => {}),
        ],
      ),
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
              child: new CarouselSlider(
                viewportFraction: 0.9,
                items: todoData
                    .map((i) =>
                new Builder(
                  builder: (BuildContext context) {
                    return new Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: new Image.asset(
                        'images/demo2.jpg',
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                ))
                    .toList(),
                height: 240.0,
                autoPlay: true,
              ),
            ),
            new Divider(),
            new Column(
              children: _list,
            )

            /*
            new ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: todoData.length,
                itemBuilder: (BuildContext context, int index) {
                  return new ListTile(
                    leading: new Icon(
                      Icons.desktop_mac,
                      color: Colors.orange,
                    ),
                    title: Text(todoData[index].title),
                    subtitle: Text(todoData[index].description),
                    onTap: () {

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return new WorkDetailPage(work: todoData[index]);
                      }));

                    },
                  );
                }),
                */
          ],
        ),
      ),
    );
  }
}
