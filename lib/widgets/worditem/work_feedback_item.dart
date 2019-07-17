import 'package:flutter/material.dart';
import 'package:yh_lwgl/res/colors.dart';
import 'package:yh_lwgl/res/styles.dart';
import 'package:yh_lwgl/widgets/image_utils.dart';

///文件管理详情==》反馈结果

class WorkFeedBackItem extends StatelessWidget {
  //标题
  final String title;

  //内容
  final String content;

  //显示的位置
  final TextAlign textAlign;

  //字体样式
  final TextStyle textStyle;

  //最大显示多少行
  final int maxLines;

  //点击回调
  final GestureTapCallback callback;

  //内容标题
  final String conteneTitle;

  //内容时间
  final String contentData;

  //内容状态
  final bool contentState;

  //是否显示子级内容
  final bool isDisplay;

  WorkFeedBackItem({
    Key key,
    this.callback,
    @required this.title,
    this.content = '',
    this.textAlign = TextAlign.start,
    this.textStyle = TextStyles.textGray14,
    this.maxLines = 1,
    @required this.isDisplay = false,
    this.conteneTitle,
    this.contentData,
    this.contentState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
        onTap: callback,
        child: Column(
          children: <Widget>[
            _item(context),
            Offstage(
              // 类似于gone
              offstage: isDisplay,
              child: _itemSublevel(context),
            )
          ],
        ));
  }

  Widget _item(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 15.0),
        padding: const EdgeInsets.fromLTRB(0, 15.0, 15.0, 15.0),
        constraints: BoxConstraints(
          maxHeight: double.infinity,
          minHeight: 50.0,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border(
          //画线
          bottom: Divider.createBorderSide(context,
              color: Colours.line, width: 0.6),
        )),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  title,
                  style: TextStyles.textDark14,
                ),
                Spacer(),
                Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                      child: Text(
                        content,
                        textAlign: maxLines == 1 ? TextAlign.right : textAlign,
                        style: textStyle ?? TextStyles.textDark14,
                        maxLines: maxLines,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )),
                Opacity(
                  opacity: callback == null ? 0 : 1,
                  child: Padding(
                    padding: EdgeInsets.only(top: maxLines == 1 ? 0.0 : 2.0),
                    child: loadAssetImage('ic_arrow_right',
                        width: 16.0, height: 16.0),
                  ),
                )
              ],
            ),
          ],
        ));
  }


  Widget _itemSublevel(BuildContext context) {
    return Container(

        constraints: BoxConstraints(
          maxHeight: double.infinity,
          minHeight: 50.0,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border(
              //画线
              bottom: Divider.createBorderSide(
                  context,
                  color: Colours.line, width: 0.6),
            )),
        child:Container(
          margin: const EdgeInsets.only(left: 15.0),
          padding: const EdgeInsets.fromLTRB(0, 15.0, 15.0, 15.0),
          child:  Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    conteneTitle,
                    style: TextStyles.textNormal12,
                  ),

                  Text(
                    contentData,
                    style: TextStyles.textNormal12,
                  ),

                  Text(
                    contentState?'已读':'已读',
                    style: TextStyle(fontSize: 12.0,color:contentState?Colors.yellow[700]:Colors.red[700] ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
