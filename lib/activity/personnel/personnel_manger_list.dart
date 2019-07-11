import 'package:flutter/material.dart';

class PersonnelMangerList extends StatefulWidget{

  int index;

  const PersonnelMangerList({
    Key key,
    @required this.index
  }): super(key: key);

  @override
  personnelMangerListState createState()=>personnelMangerListState();

}

class personnelMangerListState extends State<PersonnelMangerList> with AutomaticKeepAliveClientMixin<PersonnelMangerList>,SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Text("hello"),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => null;

}