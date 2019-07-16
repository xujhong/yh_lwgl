import 'package:flutter/material.dart';
import 'package:yh_lwgl/common/common.dart';
import 'package:yh_lwgl/common/pagestatus.dart';
import 'package:yh_lwgl/model/word_entity.dart';
import 'package:yh_lwgl/net/request.dart';
import 'package:yh_lwgl/widgets/toast.dart';
import 'package:yh_lwgl/widgets/error_view.dart';
import 'package:yh_lwgl/widgets/loading.dart';
import 'package:yh_lwgl/widgets/pullrefresh/pullrefresh.dart';
import 'package:yh_lwgl/widgets/worditem/word_item.dart';

class TextManageListActivity extends StatefulWidget {


  const TextManageListActivity({
    Key key,
    @required this.menuIndex
  }): super(key: key);

  final String menuIndex;

  @override
  _TextManageListActivityState createState() => _TextManageListActivityState();
}

class _TextManageListActivityState extends State<TextManageListActivity> {
  int index = 1;
  List<WordData> _listDatas;

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
        appBar: AppBar(
          title: title(),
        ),
        body: _buildBody());
  }

  //上拉加载更多数据
  _loadMore() async {
    Request().getSubscriptions(widget.menuIndex, index, '2145').then((data) {
      setState(() {
        //判断如果返回的数据长度没有达到达到一页则下一页没有数据
        if(isDataEmpty){
          _listDatas.addAll(data);
          index++;
        }
        isData(data);

      });
    }).catchError((e) {
      Toast.show(e.message);
    });
  }

  //下拉舒心数据
  _refresh() async {
    index = 1;
    Request().getSubscriptions(widget.menuIndex, index, '2145').then((data) {
      setState(() {
        //如果不足一页则下页没有数据
        _listDatas = data;
        index++;
        status = PageStatus.DATA;
        isData(data);
      });
    }).catchError((e) {
      Toast.show(e.message);
    });
  }

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
    return WordItem(item);
  }

  Widget title(){
    String titlename;
    if(widget.menuIndex=='1'){
      titlename='制度汇编';
    }else if(widget.menuIndex=='2'){
      titlename='知识库';
    }else if(widget.menuIndex=='4'){
      titlename='法律法规';
    }else {
      titlename='综合查询';
    }

    return Text(titlename);
  }
}


