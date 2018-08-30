import 'package:flutter/material.dart';

import './pages/MainPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // 该标题会显示在任务列表中
      title: 'Flutter Demo',

      // 主题配置
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),

      // 不显示右上角的 DEBUG 标签
      debugShowCheckedModeBanner: false,

      // 指定主页
      home: new MainPage(),

      // 路由配置

    );
  }
}
