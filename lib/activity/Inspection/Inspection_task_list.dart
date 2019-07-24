import 'package:flutter/material.dart';
import 'package:yh_lwgl/res/styles.dart';
import 'package:yh_lwgl/widgets/image_utils.dart';
import 'package:yh_lwgl/widgets/popup_window.dart';
import 'package:yh_lwgl/widgets/toast.dart';

///巡检任务列表
class InspectionTaskList extends StatefulWidget {
  @override
  InspectionTaskListState createState() => InspectionTaskListState();
}

class InspectionTaskListState extends State<InspectionTaskList> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin{
  GlobalKey _buttonKey = GlobalKey();
  GlobalKey _bodyKey = GlobalKey();

  List<String> _sortList = ["全部商品", "个人护理", "饮料", "沐浴洗护", "厨房用具", "休闲食品", "生鲜水果", "酒水", "家庭清洁"];
  var _sortIndex = 0;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Column(
          key: _bodyKey,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              key: _buttonKey,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                    child: Text(
                      _sortList[_sortIndex],
                      style: TextStyles.textBoldDark24,
                    ),
                  ),
                  loadAssetImage("expand", width: 16.0, height: 16.0)
                ],
              ),
              onTap: (){
                _showSortMenu();
              },
            ),
          ],
        ),
      ),
    );
  }
  _showSortMenu(){
    // 获取点击控件的坐标
    final RenderBox button = _buttonKey.currentContext.findRenderObject();
    final RenderBox overlay = Overlay.of(context).context.findRenderObject();
    // 获得控件左下方的坐标
    var a =  button.localToGlobal(Offset(0.0, button.size.height + 12.0), ancestor: overlay);
    // 获得控件右下方的坐标
    var b =  button.localToGlobal(button.size.bottomLeft(Offset(0, 12.0)), ancestor: overlay);
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(a, b),
      Offset.zero & overlay.size,
    );
    final RenderBox body = _bodyKey.currentContext.findRenderObject();
    showPopupWindow(
      context: context,
      fullWidth: true,
      position: position,
      elevation: 0.0,
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: (){
          //关闭
          Navigator.pop(context);
        },
        child: Container(
          color: Color(0x99000000),
          height: body.size.height - button.size.height - 12.0,
          child: ListView.builder(
            physics: ClampingScrollPhysics(),
            itemCount: _sortList.length + 1,
            itemBuilder: (_, index){
              return index == _sortList.length ? Container(
                color: Colors.white,
                height: 12.0,
              ) : Material(
                color: Colors.white,
                child: InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          _sortList[index],
                          style: index == _sortIndex ? TextStyles.textMain14 : TextStyles.textDark14,
                        ),
                        Text(
                          "($index)",
                          style: index == _sortIndex ? TextStyles.textMain14 : TextStyles.textDark14,
                        ),
                      ],
                    ),
                  ),
                  onTap: (){
                    setState(() {
                      _sortIndex = index;
                    });
                    Toast.show("选择分类: ");//${_sortList[index]}
                    //关闭
                    Navigator.pop(context);
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
