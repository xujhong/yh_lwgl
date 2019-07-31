import 'package:flutter/material.dart';
import 'package:yh_lwgl/common/common.dart';
import 'package:yh_lwgl/common/pagestatus.dart';
import 'package:yh_lwgl/model/hidden/fxyh_list_entity.dart';
import 'package:yh_lwgl/net/request.dart';
import 'package:yh_lwgl/widgets/error_view.dart';
import 'package:yh_lwgl/widgets/hidden/hiddenfindrecord_Item.dart';
import 'package:yh_lwgl/widgets/loading.dart';
import 'package:yh_lwgl/widgets/pullrefresh/pullrefresh.dart';
import 'package:yh_lwgl/widgets/toast.dart';

//发现隐患提交记录
class HiddenFindRecordList extends StatefulWidget{
  @override
  _hiddenFindRecordList createState()=>_hiddenFindRecordList();

}

class _hiddenFindRecordList extends State<HiddenFindRecordList>{

  int intPage = 1;
  final ScrollController scrollController = new ScrollController();
  PageStatus status = PageStatus.LOADING;
  List<FxyhListData> _fxyhListDataList = new List();
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
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('提交记录'),
      ),
      body: Container(
          child: _bodyBuild(),
      ),
    );
  }


  Widget _bodyBuild(){
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
              return HiddenFindRecordItem(fxyhListData: _fxyhListDataList[index]);
            },
            itemCount: _fxyhListDataList.length,
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
    Request().getAjax_query_fxyh_list(2145).then((data) {
      setState(() {
        //如果不足一页则下页没有数据
        _fxyhListDataList = data;
        intPage++;
        status = PageStatus.DATA;

      });
    }).catchError((e) {
      print('错误');
      print(e.toString());
      Toast.show(e.message);
    });
  }
}