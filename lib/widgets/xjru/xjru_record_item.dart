import 'package:flutter/material.dart';
import 'package:yh_lwgl/activity/Inspection/Inspection_record_detail.dart';
import 'package:yh_lwgl/model/xjru/xjrw_list_entity.dart';
import 'package:yh_lwgl/res/colors.dart';
import 'package:yh_lwgl/res/styles.dart';

class XjruRecordItem extends StatelessWidget {
  XjrwListData xjrwListData;

  XjruRecordItem({Key key, @required this.xjrwListData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: InkWell(
        onTap: (){
          if(xjrwListData.zrwYjcs>0)
          //法律法规
            Navigator.of(context)
              .push(new MaterialPageRoute<Null>(builder: (context) {
            return new InspectionRecordDetail(xjrwListData: xjrwListData,);
          }));
        },
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
                      style: TextStyles.textDark16,
                    ),
                    _colorBuider(),
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
                          style: TextStyle(fontSize: 16.0, color: Colors.yellow),
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
                          '${xjrwListData.zrwYjcs}',
                          style: TextStyle(fontSize: 16.0, color: Colors.yellow),
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
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: 15.0),
                padding: const EdgeInsets.fromLTRB(0.0, 5.0, 15.0, 0.0),
                child: Text(
                  '${xjrwListData.zybwMc}',
                  style: TextStyles.textNormal14,
                ),
              ),

              Container(
                margin: const EdgeInsets.only(left: 15.0),
                padding: const EdgeInsets.fromLTRB(0.0, 5.0, 15.0, 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('${xjrwListData.zrwYhtm}',
                        style: TextStyles.textNormal14,
                        softWrap: true,
                        maxLines: 100),
                    Gaps.hGap10,

                    Offstage(
                      offstage: xjrwListData.zrwYjcs==0,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.blue[500],
                        size: 15.0,
                      ),
                    ),

                  ],
                ),
              ),

              Container(
                alignment: Alignment.topRight,
                margin: const EdgeInsets.only(left: 15.0),
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 15.0),
                child: Text(
                  '${xjrwListData.staffName}',
                  style: TextStyles.textNormal14,
                ),
              ),
            ]),
      ),
    );
  }

  //颜色
  Widget _colorBuider() {
    String state = '';
    Color color;

    switch (xjrwListData.zrwStatus) {
      case 0:
        state = '正在执行';
        color = Colors.blue[500];
        break;

      case 1:
        state = '逾期';
        color = Colors.red[500];
        break;

      case 2:
        state = '未完成';
        color = Colors.orange[500];
        break;

      case 3:
        state = '任务完成';
        color = Colors.green[500];
        break;
    }

    return Text(
      state,
      style: TextStyle(fontSize: 14.0, color: color),
    );
  }
}
