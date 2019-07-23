import 'package:flutter/material.dart';
import 'package:yh_lwgl/model/slry_entity.dart';
import 'package:yh_lwgl/model/tzzyry_entity.dart';
import 'package:yh_lwgl/res/colors.dart';
import 'package:yh_lwgl/res/styles.dart';
import 'package:yh_lwgl/widgets/image_utils.dart';

class PersonnelMangerTzzyryItem extends StatelessWidget {

  TzzyryData tzzyryData;

  PersonnelMangerTzzyryItem(@required this.tzzyryData) : super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Container(padding: const EdgeInsets.only(left: 10.0,top: 5.0),
          child:  loadAssetImage(_imageState(), width: 50.0, height: 40.0),
        ),
        Container(
          padding: const EdgeInsets.only(left: 15.0, top: 40.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
                border: Border(
                    bottom: Divider.createBorderSide(context,
                        color: Colours.line, width: 0.8))),
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: Column(
                    children: <Widget>[
                      loadNetworkImage(tzzyryData.txFjwjFwdz,
                          width: 72.0, height: 72.0),
                      Gaps.vGap5,
                      Text(tzzyryData.tzzyGz??'-',style: TextStyle(fontWeight: FontWeight.bold,color: _colorWidget()),),
                    ],
                  )),


                  Gaps.hGap8,
                  Expanded(
                    flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('证书编号:${tzzyryData.tzzyAqzs??'-'}',style: TextStyles.textNormal14),
                          Gaps.vGap5,
                          Text('姓 名:${tzzyryData.tzzyXm??'-'}',style: TextStyles.textNormal14),
                          Gaps.vGap5,
                          Text('身份证号:${tzzyryData.tzzySfzh??'-'}',style: TextStyles.textNormal14),
                          Gaps.vGap5,
                          Text('进场日期:${tzzyryData.tzzyJcrq??'-'}',style: TextStyles.textNormal14),
                          Gaps.vGap5,
                          Text('工作班组:${tzzyryData.tzzyGzbz??'-'}',style: TextStyles.textNormal14),
                        ],
                      )
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }


  Color _colorWidget(){
    Color color;
    //0：未归档，1：已归档，2：已退场
    switch(tzzyryData.tzzyRyzt){
      case 0:
        color=Colors.red[700];
        break;
      case 1:
        color=Colors.blue[700];
        break;
      case 2:
        color=Colors.yellow[700];
        break;
    }

    return color;
  }

  String _imageState() {
    String assImage;
    switch (tzzyryData.tzzyRyzt) {
      case 0:
        assImage = 'img_icon_publish';
        break;
      case 1:
        assImage = 'img_icon_over';
        break;
      case 2:
        assImage = 'img_icon_outed';
        break;
    }
    return assImage;
  }
}
