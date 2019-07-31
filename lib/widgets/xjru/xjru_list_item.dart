import 'package:flutter/material.dart';
import 'package:yh_lwgl/model/xjru/xjrw_list_entity.dart';
import 'package:yh_lwgl/res/colors.dart';
import 'package:yh_lwgl/res/styles.dart';

class XjruListItem extends StatelessWidget {

  XjrwListData xjrwListData;
  final GestureTapCallback onstandardTap;
  final GestureTapCallback onTapoperation;

  XjruListItem({Key key, @required this.xjrwListData,this.onstandardTap,this.onTapoperation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    xjrwListData.xjrwName ?? '-',
                    style: TextStyles.textNormal14,
                  ),
                  InkWell(
                    onTap: onstandardTap,
                    child: Icon(
                      Icons.error,
                      color: Colors.blue[500],
                    ) ,
                  ),
                ],
              ),
            ),
//
            Container(
              margin: const EdgeInsets.only(left: 15.0),
              padding: const EdgeInsets.fromLTRB(0.0, 15.0, 15.0, 0.0),
              child: Row(
                children: <Widget>[
                 Row(
                   children: <Widget>[
                     Text(
                       '未检 ',
                       style: TextStyles.textNormal14,
                     ),
                     Text(
                       '${xjrwListData.zrwWjcs}',
                       style: TextStyle(fontSize: 16.0,color: Colors.yellow),
                     ),
                     Text(
                       ' 次',
                       style: TextStyles.textNormal14,
                     )
                   ],
                 ),
                  Gaps.hGap10,
                  Row(
                    children: <Widget>[
                      Text(
                        '已检 ',
                        style: TextStyles.textNormal14,
                      ),
                      Text(
                        '${xjrwListData.zrwWjcs}',
                        style: TextStyle(fontSize: 16.0,color: Colors.yellow),
                      ),
                      Text(
                        ' 次',
                        style: TextStyles.textNormal14,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15.0),
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '${xjrwListData.zybwMc}',
                    style: TextStyles.textNormal14,
                  ),
                  Gaps.hGap10,
                  Text(
                    '${xjrwListData.zrwJclx}',
                    style: TextStyles.textNormal14,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15.0),
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '${xjrwListData.startTime}-${xjrwListData.endTime}',
                    style: TextStyles.textNormal14,
                  ),
                  Gaps.hGap10,

                  InkWell(
                    onTap: onTapoperation,
                    child:  Icon(
                      Icons.menu,
                      color: Colors.blue[500],
                    ),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
