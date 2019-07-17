import 'package:flutter/material.dart';
import 'package:yh_lwgl/common/common.dart';
import 'package:yh_lwgl/common/pagestatus.dart';
import 'package:yh_lwgl/model/word_glwjxf_entity.dart';
import 'package:yh_lwgl/net/request.dart';
import 'package:yh_lwgl/widgets/error_view.dart';
import 'package:yh_lwgl/widgets/loading.dart';
import 'package:yh_lwgl/widgets/pullrefresh/pullrefresh.dart';
import 'package:yh_lwgl/widgets/toast.dart';
import 'package:yh_lwgl/widgets/worditem/managerword_item.dart';

///管理文件
class ManagementWordActivity extends StatefulWidget{
  @override
  _managementWordActivityState createState()=>_managementWordActivityState();
}

class _managementWordActivityState extends State<ManagementWordActivity>{

  int indexPage = 1;
  List<WordGlwjxfData> _listDatas;

  ///滚动控制与监听
  final ScrollController scrollController = new ScrollController();
  PageStatus status = PageStatus.LOADING;
  //判断数据是否已经加载完成
  bool isDataEmpty=true;

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
      appBar: AppBar(title: Text('管理文件'),),
      body: Container(
        child: _buildBody(),
      ),
    );
  }

  //上拉加载更多数据
  _loadMore() async {
    Request().getAjax_query_glwjxf_list('2145', indexPage).then((data) {
      setState(() {
        //判断如果返回的数据长度没有达到达到一页则下一页没有数据
        if(isDataEmpty){
          _listDatas.addAll(data);
          indexPage++;
        }
        isData(data);

      });
    }).catchError((e) {
      Toast.show(e.message);
    });
  }

  //下拉舒心数据
  _refresh() async {
    indexPage = 1;
    Request().getAjax_query_glwjxf_list('2145',indexPage).then((data) {
      setState(() {
        //如果不足一页则下页没有数据
        _listDatas = data;
        indexPage++;
        status = PageStatus.DATA;
        isData(data);
      });
    }).catchError((e) {
      Toast.show(e.message);
    });
  }

  ///判断当前返回数据是否存在下一页
  bool isData(data){
    if(data.length<Constant.PAGE_SIZE){
      isDataEmpty=false;
    }
    return isDataEmpty;
  }

  //列表数据
  Widget _buildBody() {
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
              return makeCard(_listDatas[index]);
            },
            itemCount: _listDatas.length,
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

  //item的样式
  Widget makeCard(item) {
    return ManagerWordItem(item);
  }

}



