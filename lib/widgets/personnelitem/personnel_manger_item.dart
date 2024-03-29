import 'package:flutter/material.dart';
import 'package:yh_lwgl/activity/personnel/personnel_manger_details.dart';
import 'package:yh_lwgl/model/slry_entity.dart';
import 'package:yh_lwgl/res/colors.dart';
import 'package:yh_lwgl/res/styles.dart';
import 'package:yh_lwgl/widgets/image_utils.dart';

class PersonnelMangerItem extends StatelessWidget {
  SlryData slryData;

  PersonnelMangerItem(@required this.slryData) : super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
        onTap: () {

          Navigator.of(context).push(MaterialPageRoute<Null>(builder: (context){
            return new PersonnelMangerDetails(slryData);
          }));
          
        },
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 10.0),
              child: loadAssetImage(_imageState(), width: 50.0, height: 40.0),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15.0, top: 35.0),
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
                          loadNetworkImage(slryData.fjwjFwdzss,
                              width: 72.0, height: 72.0),
                          Gaps.vGap5,
                          Text(
                            slryData.zwName ?? '-',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: _colorWidget()),
                          ),
                        ],
                      )),
                      Gaps.hGap8,
                      Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('姓 名:${slryData.tzzyXm ?? '-'}',
                                  style: TextStyles.textNormal14),
                              Gaps.vGap5,
                              Text('身份证号:${slryData.slrySfzh ?? '-'}',
                                  style: TextStyles.textNormal14),
                              Gaps.vGap5,
                              Text('进场日期:${slryData.slryJcrq ?? '-'}',
                                  style: TextStyles.textNormal14),
                              Gaps.vGap5,
                              Text('人员类型:${slryData.slryJszc ?? '-'}',
                                  style: TextStyles.textNormal14),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Color _colorWidget() {
    Color color;
    //0：未归档，1：已归档，2：已退场
    switch (slryData.slryRyzt) {
      case 0:
        color = Colors.red[700];
        break;
      case 1:
        color = Colors.blue[700];
        break;
      case 2:
        color = Colors.yellow[700];
        break;
    }
    return color;
  }

  String _imageState() {
    String assImage;
    switch (slryData.slryRyzt) {
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
