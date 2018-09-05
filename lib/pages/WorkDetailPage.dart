import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_simple_video_player/flutter_simple_video_player.dart';
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
            NetVideo(
                "https://youku.cdn-56.com/20180622/3878_d3968706/index.m3u8"),
            new CarouselSlider(
                items: [1, 2, 3, 4, 5].map((i) {
                  return new Builder(
                    builder: (BuildContext context) {
                      return new Container(
                          width: MediaQuery.of(context).size.width,
                          margin: new EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: new BoxDecoration(color: Colors.amber),
                          child: new Text(
                            'text $i',
                            style: new TextStyle(fontSize: 16.0),
                          ));
                    },
                  );
                }).toList(),
                height: 400.0,
                autoPlay: true),
            Text('${work.title}'),
            Text('${work.description}'),
          ],
        ),
      ),
    );
  }
}
