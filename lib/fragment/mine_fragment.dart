import 'package:flutter/material.dart';

class MineFragment extends StatefulWidget{
  @override
  _mine_fragment createState() =>_mine_fragment();
}

class _mine_fragment extends State<MineFragment>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("我的"),
      ),
      body: Center(
         child:  Text("我的"),
      ),
    );
  }

}