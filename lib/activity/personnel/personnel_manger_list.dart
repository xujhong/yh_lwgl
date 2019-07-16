import 'package:flutter/material.dart';

class PersonnelMangerList extends StatefulWidget {
  const PersonnelMangerList({Key key, @required this.index}) : super(key: key);

  final int index;

  @override
  personnelMangerListState createState() => personnelMangerListState();
}

class personnelMangerListState extends State<PersonnelMangerList>
    with
        AutomaticKeepAliveClientMixin<PersonnelMangerList>,
        SingleTickerProviderStateMixin {
  List _list = [1,2,3];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      body: Center(child: Text('hello'),),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
