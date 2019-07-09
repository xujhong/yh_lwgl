import 'package:flutter/material.dart';

class SectionTwoTitle extends StatelessWidget {
  final String title;
  final Color titleColor;

  const SectionTwoTitle({Key key, this.title,this.titleColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 2.0,
              height: 25.0,
              color: titleColor,
            ),
           Container(
             padding: EdgeInsets.only(left: 10.0),
             child:  Text(
               title,
               style: TextStyle( fontSize: 16.0),
             ),
           )
          ],
        ),
      ),
    );
  }
}
