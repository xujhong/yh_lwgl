import 'package:flutter/material.dart';
import 'package:yh_lwgl/widgets/word_item.dart';

class TextManageListActivity extends StatefulWidget {
  @override
  _TextManageListActivityState createState() => _TextManageListActivityState();
}

class _TextManageListActivityState extends State<TextManageListActivity> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("制度汇编"),
      ),
      body: Container(

        child: ListView(
          children: <Widget>[
            item(),
            item(),
            item(),
            item()
          ],
        ),


      ),
    );
  }

  Widget item(){

    return WordItem();
  }
}
