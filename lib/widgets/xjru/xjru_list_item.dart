import 'package:flutter/material.dart';
import 'package:yh_lwgl/model/xjru/xjrw_list_entity.dart';
import 'package:yh_lwgl/res/colors.dart';
import 'package:yh_lwgl/res/styles.dart';

class XjruListItem extends StatelessWidget {

  XjrwListData xjrwListData;

  XjruListItem({Key key, @required this.xjrwListData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {},
      child: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 15.0),
            padding: const EdgeInsets.fromLTRB(0.0, 15.0, 15.0, 15.0),
            constraints: BoxConstraints(
              minHeight: 50.0,
              maxHeight: double.infinity,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border(
                    bottom: Divider.createBorderSide(context,
                        color: Colours.line, width: 0.6))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(xjrwListData.endTime??'-',style: TextStyles.textNormal14,),
                Icon(Icons.error,color: Colors.blue[500],),
              ],
            ),
          )
        ],
      ),
    );
  }
}
