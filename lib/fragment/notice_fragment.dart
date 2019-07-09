import 'package:flutter/material.dart';

class NoticeFragment extends StatefulWidget{
  @override
  _notice_fragment createState() =>_notice_fragment();
}

class _notice_fragment extends State<NoticeFragment>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("消息"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("消息"),
      ),
    );
  }

}