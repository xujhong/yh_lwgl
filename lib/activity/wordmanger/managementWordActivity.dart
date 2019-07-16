import 'package:flutter/material.dart';
import 'package:yh_lwgl/net/request.dart';

///管理文件
class ManagementWordActivity extends StatefulWidget{
  @override
  _managementWordActivityState createState()=>_managementWordActivityState();
}

class _managementWordActivityState extends State<ManagementWordActivity>{

  int pageIndex;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('管理文件'),),
      body: Container(

      ),
    );
  }

  //上拉加载更多数据
  _loadMore() async {
    Request().getAjax_query_glwjxf_list('2145', index).then((data) {
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
    Request().getAjax_query_glwjxf_list(widget.menuIndex, index, '2145').then((data) {
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

}



