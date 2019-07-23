import 'package:flutter/material.dart';
import 'package:yh_lwgl/model/slry_detail_entity.dart';
import 'package:yh_lwgl/model/slry_entity.dart';
import 'package:yh_lwgl/net/request.dart';
import 'package:yh_lwgl/net/requestimpl.dart';
import 'package:yh_lwgl/res/colors.dart';
import 'package:yh_lwgl/widgets/click_item.dart';
import 'package:yh_lwgl/widgets/error_view.dart';
import 'package:yh_lwgl/widgets/id_photo_show_widget.dart';
import 'package:yh_lwgl/widgets/loading.dart';
import 'package:yh_lwgl/widgets/toast.dart';

///人员详情
class PersonnelMangerDetails extends StatefulWidget {
  SlryData slryData;

  PersonnelMangerDetails(this.slryData);

  @override
  _personnelMangerDetailsState createState() => _personnelMangerDetailsState();
}

class _personnelMangerDetailsState extends State<PersonnelMangerDetails> with AutomaticKeepAliveClientMixin<PersonnelMangerDetails> ,SingleTickerProviderStateMixin{

  //请求返回的对象
  AsyncSnapshot<SlryDetailData> _slryDetailData;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('详情'),
      ),
      body: FutureBuilder(
        future: RequestImpl.getAjax_slry_detail(widget.slryData.slryId),
        builder: (context, AsyncSnapshot<SlryDetailData> snap) {
          if (snap.connectionState == ConnectionState.done) {
            if (snap.hasError) {
              return ErrorView(
                onClick: () {
                  RequestImpl.getAjax_slry_detail(widget.slryData.slryId);
                },
              );
            }
            //加载完成
            _slryDetailData = snap;
            return _bodyBuild();
          } else if (snap.connectionState == ConnectionState.waiting) {
            //加载中
            print('waiting');
            return Loading();
          }
        },
      ));

  }

  Widget _bodyBuild() {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
            child: Column(
          children: <Widget>[
            ClickItem(
              title: '标段',
              content: '${_slryDetailData.data.organName}',
            ),
            Container(
              width: double.infinity,
              height: 8.0,
              color: Colours.line,
            ),
          IDPhotoShowWidget(_IDphoto( _slryDetailData.data.sfzList)),
            ClickItem(
              title: '姓名',
              content: _slryDetailData.data.tzzyXm,
            ),
            ClickItem(
              title: '职务',
              content: _slryDetailData.data.zwName,
            ),
            ClickItem(
              title: '进场日期',
              content: _slryDetailData.data.slryJszc,
            ),
            ClickItem(
              title: '身份证号',
              content: _slryDetailData.data.slrySfzh,
            ),
            Container(
              width: double.infinity,
              height: 8.0,
              color: Colours.line,
            ),
            ClickItem(
              title: '技术职称',
              content: _slryDetailData.data.slryJszc,
            ),
            ClickItem(
              title: '安全证书编号',
              content: _slryDetailData.data.slryAqzs,
            ),
            ClickItem(
              title: '发证部门',
              content: _slryDetailData.data.slryFzbm,
            ),
            ClickItem(
              title: '发证日期',
              content: _slryDetailData.data.slryFzrq,
            ),
            ClickItem(
              title: '复审日期',
              content: _slryDetailData.data.slryFsrq,
            ),
          ],
        ))
      ],
    );
  }

  List<String> _IDphoto(List<SlryDetailDataSfzlist> sfzList){

    List<String> photo=new List();

    for(int i=0;i<sfzList.length;i++){
      photo.add(sfzList[i].fjwjFwdz??'');
    }

    return photo;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
