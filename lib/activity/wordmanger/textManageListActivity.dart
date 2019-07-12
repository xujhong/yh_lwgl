import 'package:flutter/material.dart';
import 'package:yh_lwgl/model/word_entity.dart';
import 'package:yh_lwgl/presenter/post_presenter.dart';
import 'package:yh_lwgl/widgets/pull/nested_refresh.dart';
import 'package:yh_lwgl/widgets/word_item.dart';

class TextManageListActivity extends StatefulWidget {
  @override
  _TextManageListActivityState createState() => _TextManageListActivityState();
}

class _TextManageListActivityState extends State<TextManageListActivity> {
  final GlobalKey<RefreshIndicatorState> refreshKey = new GlobalKey();
  final ScrollController _scrollController = new ScrollController();

  List<WordData> dataList = new List();

  /// NestedScrollView 的刷新状态 GlobalKey ，方便主动刷新使用
  final GlobalKey<NestedScrollViewRefreshIndicatorState> refreshIndicatorKey =
      new GlobalKey<NestedScrollViewRefreshIndicatorState>();

  ///滚动控制与监听
  final ScrollController scrollController = new ScrollController();

  //显示刷新
  _showRefreshLoading() {
    new Future.delayed(const Duration(seconds: 0), () {
      refreshIndicatorKey.currentState.show().then((e) {});
      return true;
    });
  }

  //绘制item
  _renderItem(e) {
    //item点击事件
    return WordItem(
      e,
      onPressed: () {},
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PostPresenter.ajaxQueryWdxxList();
  }

  Future<void> requestRefresh() async {
    return trendBloc.requestRefresh(selectTime, selectType);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("制度汇编"),
      ),
      body: Container(
          child: NestedScrollViewRefreshIndicator(
        key: refreshIndicatorKey,
        //嵌套滑动
        child: NestedScrollView(
            controller: scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) {},///添加一起滑动的头部信息
            body: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context,index){
                  _renderItem(dataList[index]);
                },
            itemCount: dataList.length,)),
            onRefresh: requestRefresh,
      )),
    );
  }
}
