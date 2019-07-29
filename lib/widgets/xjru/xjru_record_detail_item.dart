import 'package:flutter/material.dart';
import 'package:yh_lwgl/model/xjru/xjrw_yjczrw_detail_entity.dart';
import 'package:yh_lwgl/res/colors.dart';
import 'package:yh_lwgl/res/styles.dart';
import 'package:yh_lwgl/widgets/photo_grived_shou.dart';

class XjruRecordDetailItem extends StatelessWidget {
  XjrwYjczrwDetailData xjrwYjczrwDetailData;

  XjruRecordDetailItem({Key key, @required this.xjrwYjczrwDetailData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Card(
        child: InkWell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 15.0),
                padding: const EdgeInsets.fromLTRB(0.0, 15.0, 15.0, 15.0),
                constraints:
                    BoxConstraints(minHeight: 50.0, maxHeight: double.infinity),
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: Divider.createBorderSide(context,
                            color: Colours.line, width: 0.6))),
                child: Row(
                  children: <Widget>[
                    Text(xjrwYjczrwDetailData.remark,style: TextStyles.textDark16)
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.only(left: 15.0),
                padding: const EdgeInsets.fromLTRB(0.0, 15.0, 15.0, 0.0),
                child: PhotoGrivedShow(urlPhoto: _zsListIcon(),),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15.0),
                padding: const EdgeInsets.fromLTRB(0.0, 15.0, 15.0, 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(xjrwYjczrwDetailData.acturalTime,style: TextStyles.textNormal14,),
                    _colorBuider(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //证书
  List<String> _zsListIcon(){
    List<String> photo = new List();
    for (int i = 0; i < xjrwYjczrwDetailData.fjwjList.length; i++) {
      photo.add(xjrwYjczrwDetailData.fjwjList[i].fjwjFwdz);
    }
    return photo;
  }


  //颜色
  Widget _colorBuider() {
    String state = '';
    Color color;

    switch (xjrwYjczrwDetailData.xjjlStatus) {
      case 0:
        state = '通过';
        color = Colors.green[500];
        break;

      case 1:
        state = '纠正';
        color = Colors.yellow[500];
        break;

      case 2:
        state = '整改';
        color = Colors.deepOrange[500];
        break;

    }

    return Text(
      state,
      style: TextStyle(fontSize: 14.0, color: color),
    );
  }
}
