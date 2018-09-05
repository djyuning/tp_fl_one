import 'package:flutter/material.dart';

import './pages/MainPage.dart';
import './pages/ThemePage.dart';
import './pages/WorkDetailPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '黑鬼',
      // 该标题会显示在任务列表中

      // 主题配置
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),

      // 不显示右上角的 DEBUG 标签
      debugShowCheckedModeBanner: false,

      // 指定主页
      home: new MainPage(),

      // 路由配置
      routes: <String, WidgetBuilder>{
        'themePage': (BuildContext context) => new ThemePage(),
      },
    );
  }
}
