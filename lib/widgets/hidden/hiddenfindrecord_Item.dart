import 'package:flutter/material.dart';
import 'package:yh_lwgl/model/hidden/fxyh_list_entity.dart';
import 'package:yh_lwgl/res/colors.dart';
import 'package:yh_lwgl/res/styles.dart';
import 'package:yh_lwgl/widgets/image_utils.dart';

class HiddenFindRecordItem extends StatelessWidget {
  FxyhListData fxyhListData;

  HiddenFindRecordItem({@required this.fxyhListData});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
        onTap: () {},
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
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('隐患来源:\t${getSoure()}',
                                  style: TextStyles.textNormal14),
                              Gaps.vGap10,
                              Text(
                                  '检查人:\t${fxyhListData.checkedPersonName ?? '-'}',
                                  style: TextStyles.textNormal14),
                              Gaps.vGap10,
                              Text('检查日期:\t${fxyhListData.checkedTime ?? '-'}',
                                  style: TextStyles.textNormal14),
                              Gaps.vGap10,
                              Text(
                                  '整改责任人:\t${fxyhListData.reformPersonName ?? '-'}',
                                  style: TextStyles.textNormal14),
                              Gaps.vGap10,
                              Text('整改期限:\t${fxyhListData.reformDeadline ?? '-'}',
                                  style: TextStyles.textNormal14),
                            ],
                          )),
                      Gaps.hGap8,
                      Expanded(
                          child: Column(
                        children: <Widget>[
                          loadNetworkImage(fxyhListData.filePath,
                              width: 90.0, height: 90.0),
                          Gaps.vGap5,
                          loadAssetImage(getStateHidden(), width: 50.0, height: 40.0),
                        ],
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  String _imageState() {
    String assImage;
    switch (fxyhListData.yhxxStatus) {
      case 1:
        assImage = 'img_wait_update';
        break;
      case 2:
        assImage = 'img_wait_verify';
        break;
      case 3:
        assImage = 'img_pass_no_result';
        break;
      case 9:
        assImage = 'img_update_over';
        break;
    }
    return assImage;
  }

  //隐患状态
  String getStateHidden(){

    if(fxyhListData.yhxxLevel==1){
      return 'img_danger_level_com';
    }else{
      return 'img_danger_level_big';
    }
  }

  String getSoure() {
    switch (fxyhListData.yhxxSource) {
      case 1:
        return "暂无信息";
        break;
      case 2:
        return "日常巡检";
        break;
      case 3:
        return "综合检查";
        break;
      case 4:
        return "专检检查";
        break;
      case 5:
        return "发现隐患";
        break;
      default:
        return "信息未知";
        break;
    }
  }
}
