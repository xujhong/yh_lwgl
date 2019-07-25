import 'package:flutter/material.dart';
import 'package:yh_lwgl/common/common.dart';
import 'package:yh_lwgl/common/pagestatus.dart';
import 'package:yh_lwgl/model/tzzyry_details_entity.dart';
import 'package:yh_lwgl/model/xjru/xjrw_count_entity.dart';
import 'package:yh_lwgl/model/xjru/xjrw_list_entity.dart';
import 'package:yh_lwgl/net/request.dart';
import 'package:yh_lwgl/net/requestimpl.dart';
import 'package:yh_lwgl/res/colors.dart';
import 'package:yh_lwgl/res/styles.dart';
import 'package:yh_lwgl/widgets/error_view.dart';
import 'package:yh_lwgl/widgets/image_utils.dart';
import 'package:yh_lwgl/widgets/loading.dart';
import 'package:yh_lwgl/widgets/popup_window.dart';
import 'package:yh_lwgl/widgets/pullrefresh/pullrefresh.dart';
import 'package:yh_lwgl/widgets/toast.dart';
import 'package:yh_lwgl/widgets/xjru/xjru_list_item.dart';

///巡检任务列表
class InspectionTaskList extends StatefulWidget {
  @override
  InspectionTaskListState createState() => InspectionTaskListState();
}

class InspectionTaskListState extends State<InspectionTaskList>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  GlobalKey _buttonKey = GlobalKey();
  GlobalKey _bodyKey = GlobalKey();

  var _sortIndex = 0;

  int intPage = 1;
  final ScrollController scrollController = new ScrollController();
  PageStatus status = PageStatus.LOADING;

  //请求返回的对象
  AsyncSnapshot<List<XjrwCountData>> _slryDetailData;
  List<XjrwListData> _xjrwListDataList = new List();

  //判断数据是否已经加载完成
  bool isDataEmpty = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // TODO: implement build
    return Scaffold(
        body: Column(
      key: _bodyKey,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: FutureBuilder<List<XjrwCountData>>(
            future: Request().getAjax_zrw_count(2148, 1244),
            builder: (context, AsyncSnapshot<List<XjrwCountData>> snap) {
              if (snap.connectionState == ConnectionState.done) {
                if (snap.hasError) {
                  return ErrorView(
                    onClick: () {
                      Request().getAjax_zrw_count(2148, 1244);
                    },
                  );
                }
                //加载完成
                _slryDetailData = snap;
                return _buildBody();
              } else if (snap.connectionState == ConnectionState.waiting) {
                //加载中
                print('waiting');
                return Loading();
              }
            },
          ),
        ),
        Gaps.vGap16,
        Expanded(
          child: _listBuild(),
        )
      ],
    ));
  }

  Widget _buildBody() {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      key: _buttonKey,
      child: Container(
        margin: const EdgeInsets.only(left: 15.0),
        padding: const EdgeInsets.fromLTRB(0, 15.0, 15.0, 15.0),
        constraints: BoxConstraints(
          maxHeight: double.infinity,
          minHeight: 50.0,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border(
                bottom: Divider.createBorderSide(context,
                    color: Colours.line, width: 0.6))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 10.0),
              child: Text(
                _slryDetailData.data[_sortIndex].zybwMc ?? '',
                style: TextStyles.textNormal14,
              ),
            ),
            loadAssetImage("expand", width: 16.0, height: 16.0)
          ],
        ),
      ),
      onTap: () {
        _showSortMenu();
      },
    );
  }

  _listBuild() {
    switch (status) {
      case PageStatus.LOADING:
        return Loading();
        break;
      case PageStatus.DATA:
        return PullRefresh(
          onRefresh: _refresh,
          onLoadmore: _refresh,
          scrollView: ListView.builder(
            itemBuilder: (context, index) {
              return XjruListItem(xjrwListData: _xjrwListDataList[index]);
            },
            itemCount: _xjrwListDataList.length,
          ),
        );
        break;
      case PageStatus.ERROR:
      default:
        return ErrorView(
          onClick: () {
            _refresh();
          },
        );
    }
  }

  //下拉刷新数据
  _refresh() async {
    intPage = 1;
    Request().getAjax_xjrw_zrw_list(1, intPage, 2145).then((data) {
      setState(() {
        //如果不足一页则下页没有数据
        _xjrwListDataList = data;
        intPage++;
        status = PageStatus.DATA;
        isData(data);
      });
    }).catchError((e) {
      print('错误');
      print(e.toString());
      Toast.show(e.message);
    });
  }

  bool isData(data) {
    if (data.length < Constant.PAGE_SIZE) {
      isDataEmpty = false;
    }
    return isDataEmpty;
  }

  _showSortMenu() {
    // 获取点击控件的坐标
    final RenderBox button = _buttonKey.currentContext.findRenderObject();
    final RenderBox overlay = Overlay.of(context).context.findRenderObject();
    // 获得控件左下方的坐标
    var a = button.localToGlobal(Offset(0.0, button.size.height + 12.0),
        ancestor: overlay);
    // 获得控件右下方的坐标
    var b = button.localToGlobal(button.size.bottomLeft(Offset(0, 12.0)),
        ancestor: overlay);
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
        onTap: () {
          //关闭
          Navigator.pop(context);
        },
        child: Container(
          color: Color(0x99000000),
          height: body.size.height - button.size.height - 12.0,
          child: ListView.builder(
            physics: ClampingScrollPhysics(),
            itemCount: _slryDetailData.data.length + 1,
            itemBuilder: (_, index) {
              return index == _slryDetailData.data.length
                  ? Container(
                      color: Colors.white,
                      height: 12.0,
                    )
                  : Material(
                      color: Colors.white,
                      child: InkWell(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                _slryDetailData.data[index].zybwMc,
                                style: index == _sortIndex
                                    ? TextStyles.textMain14
                                    : TextStyles.textDark14,
                              ),
                              Text(
                                "(${_slryDetailData.data[index].zrwCount})",
                                style: index == _sortIndex
                                    ? TextStyles.textMain14
                                    : TextStyles.textDark14,
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _sortIndex = index;
                          });
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
  bool get wantKeepAlive => true;
}
