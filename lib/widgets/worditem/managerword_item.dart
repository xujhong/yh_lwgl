import 'package:flutter/material.dart';
import 'package:yh_lwgl/activity/wordmanger/managementWordInfoActivity.dart';
import 'package:yh_lwgl/model/word_glwjxf_entity.dart';
import 'package:yh_lwgl/res/colors.dart';
import 'package:yh_lwgl/res/styles.dart';
import 'package:yh_lwgl/widgets/cardItem.dart';

///管理文件item
class ManagerWordItem extends StatelessWidget {
  WordGlwjxfData _wordGlwjxfData;

  ManagerWordItem(this._wordGlwjxfData) : super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 100.0,
      child: CardItem(
        child: FlatButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ManagementWordInfoActivity(
                  wordGlwjxfData: _wordGlwjxfData,
                );
              }));
            },
            child: ListTile(
              title: Container(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Text(
                  _wordGlwjxfData.wjName,
                  softWrap: true, //自动换行
                  overflow: TextOverflow.ellipsis, //截断处理
                  maxLines: 2, //最大显示两行
                  style: TextStyles.textDark14,
                ),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    _wordGlwjxfData.createdStaffName,
                    style: TextStyles.textGrayC12,
                  ),
                  Text(
                    _wordGlwjxfData.feedbackResultName,
                    style: TextStyle(
                        fontSize: 12.0, color: textColor(_wordGlwjxfData)),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Color textColor(WordGlwjxfData _wordGlwjxf) {
    if (_wordGlwjxf.feedbackResultName == '部分反馈') {
      return Colours.text_yellow;
    } else if (_wordGlwjxf.feedbackResultName == '全部反馈') {
      return Colours.text_green;
    } else if (_wordGlwjxf.feedbackResultName == '未反馈') {
      return Colours.text_red;
    } else if (_wordGlwjxf.feedbackResultName == '不需要反馈') {
      return Colours.text_text_6;
    } else if (_wordGlwjxf.feedbackResultName == '已反馈') {
      return Colours.text_green;
    }
  }
}
