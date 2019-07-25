import 'package:flutter/material.dart';
import 'package:yh_lwgl/common/pagestatus.dart';
import 'package:yh_lwgl/model/slry_entity.dart';
import 'package:yh_lwgl/net/request.dart';
import 'package:yh_lwgl/widgets/error_view.dart';
import 'package:yh_lwgl/widgets/loading.dart';
import 'package:yh_lwgl/widgets/personnelitem/personnel_manger_item.dart';
import 'package:yh_lwgl/widgets/pullrefresh/pullrefresh.dart';
import 'package:yh_lwgl/widgets/toast.dart';

class PersonnelMangerList extends StatefulWidget {
  const PersonnelMangerList({Key key, @required this.index}) : super(key: key);

  final int index;

  @override
  personnelMangerListState createState() => personnelMangerListState();
}

class personnelMangerListState extends State<PersonnelMangerList>
    with
        AutomaticKeepAliveClientMixin<PersonnelMangerList>,
        SingleTickerProviderStateMixin {
  //AutomaticKeepAliveClientMixin  页面保持状态，使他不销毁不重绘

  int intPage = 1;
  final ScrollController scrollController = new ScrollController();
  PageStatus status = PageStatus.LOADING;
  List<SlryData> _listDatas;

  //判断数据是否已经加载完成
  bool isDataEmpty = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refresh();
  }

  //下拉舒心数据
  _refresh() async {
    Request().getAjax_slry_list('1244', '2145').then((data) {
      setState(() {
        _listDatas = data;
        status = PageStatus.DATA;
      });
    }).catchError((e) {
      Toast.show(e.message);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context);
    return Scaffold(
      body: Container(
        child: _buildBody(),
      ),
    );
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
          onLoadmore: _refresh,
          scrollView: ListView.builder(
            itemBuilder: (context, index) {
              return PersonnelMangerItem(_listDatas[index]);
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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
