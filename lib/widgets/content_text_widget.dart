import 'package:flutter/material.dart';
import 'package:yh_lwgl/res/colors.dart';
import 'package:yh_lwgl/res/styles.dart';

//内容显示
class ContentTextWidget extends StatelessWidget {
  String title;
  String count;

  ContentTextWidget({@required this.title,this.count});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 15.0),
        padding: const EdgeInsets.fromLTRB(0, 15.0, 15.0, 15.0),
        constraints: BoxConstraints(
          maxHeight: double.infinity,
          minHeight: 50.0,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border(
              //画线
              bottom:
              Divider.createBorderSide(context, color: Colours.line, width: 0.6),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyles.textDark14,
            ),
            Gaps.vGap10,
           Text(count,style: TextStyle(
             fontSize: 14.0,color: Colours.text_normal,
           ),softWrap: true,maxLines: 100,)
          ],
        ),
      )
    );
  }
}
