import 'package:flutter/material.dart';
import '../modal/Todo.dart';
import 'WorkDetailPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todoData = <Todo>[
    Todo('量子力学和广义相对论在相声中的实践和应用', '董建春，李丁'),
    Todo('百鬼夜行', '董建春，李丁'),
    Todo('诗歌和爱情', '董建春，李丁'),
    Todo('聘文书', '董建春，李丁'),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView.builder(
          itemCount: todoData.length,
          itemBuilder: (BuildContext context, int index) => new ListTile(
                leading: Icon(Icons.local_movies),
                title: Text(todoData[index].title),
                subtitle: Text(todoData[index].description),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          WorkDetailPage(work: todoData[index]),
                    ),
                  );
                },
              )),
    );
  }
}
