import 'package:flutter/material.dart';

class ContactsFragment extends StatefulWidget{
  @override
  _contacts_fragment createState() =>_contacts_fragment();
}

class _contacts_fragment extends State<ContactsFragment>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("联系人"),
      ),
      body: Center(
        child: Text("联系人"),
      ),
    );
  }

}