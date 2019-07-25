import 'package:flutter/material.dart';
import 'package:yh_lwgl/common/common.dart';
import 'package:yh_lwgl/common/pagestatus.dart';
import 'package:yh_lwgl/model/xjru/xjrw_list_entity.dart';
import 'package:yh_lwgl/net/request.dart';
import 'package:yh_lwgl/widgets/error_view.dart';
import 'package:yh_lwgl/widgets/loading.dart';
import 'package:yh_lwgl/widgets/pullrefresh/pullrefresh.dart';
import 'package:yh_lwgl/widgets/toast.dart';
import 'package:yh_lwgl/widgets/xjru/xjru_record_item.dart';

///巡检记录列表
class InspectionRecordList extends StatefulWidget{

  int index;

  InspectionRecordList({Key key, this.index}) : super(key: key);

  @override
  InspectionRecordListState createState()=>InspectionRecordListState();
}

class InspectionRecordListState extends State<InspectionRecordList>{

  int intPage = 1;
  final ScrollController scrollController = new ScrollController();
  PageStatus status = PageStatus.LOADING;
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
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: _listBuild(),
      ),
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
          onLoadmore: _loadMore,
          scrollView: ListView.builder(
            itemBuilder: (context, index) {
              return XjruRecordItem(xjrwListData: _xjrwListDataList[index]);
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
    Request().getAjax_xjrw_zrw_list(widget.index, intPage, 2145,1244).then((data) {
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

  //上拉加载更多数据
  _loadMore() async {
    Request().getAjax_xjrw_zrw_list(widget.index, intPage, 2145,1244).then((data) {
      setState(() {
        //判断如果返回的数据长度没有达到达到一页则下一页没有数据
        if(isDataEmpty){
          _xjrwListDataList.addAll(data);
          intPage++;
        }
        isData(data);

      });
    }).catchError((e) {
      Toast.show(e.message);
    });
  }

  bool isData(data) {
    if (data.length < Constant.PAGE_SIZE) {
      isDataEmpty = false;
    }
    return isDataEmpty;
  }
}