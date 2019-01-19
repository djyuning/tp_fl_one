import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

@immutable
class ServerPage extends StatefulWidget {
  @override
  _ServerPageState createState() => new _ServerPageState();
}

class _ServerPageState extends State<ServerPage> {
  String name = 'Abc';

  File _image;

  // 拍照
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('服务'),
      ),
      body: new Column(
        children: <Widget>[
          _image == null ? Text('没有选择照片 ') : Image.file(_image),
          _image == null ? Text('没有选择照片 ') : Text(_image.toString()),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: getImage, // 点击拍照
        child: new Icon(Icons.add_a_photo),
      ),
    );
  }
}
