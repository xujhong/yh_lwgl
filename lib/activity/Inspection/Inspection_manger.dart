import 'package:flutter/material.dart';
import 'package:yh_lwgl/activity/Inspection/Inspection_record_list.dart';
import 'package:yh_lwgl/activity/Inspection/Inspection_task_list.dart';
import 'package:yh_lwgl/res/colors.dart';
import 'package:yh_lwgl/res/dimens.dart';
import 'package:yh_lwgl/res/styles.dart';

///日常巡检列表信息
class InspectionManger extends StatefulWidget {
  @override
  _inspectionMangerState createState() => _inspectionMangerState();
}

class _inspectionMangerState extends State<InspectionManger>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  GlobalKey _bodyKey = GlobalKey();
  int _index = 0;
  PageController _pageController = PageController(initialPage: 0);
  TabController _tabController;
  bool _isPageCanChanged = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('日常巡检'),
      ),
      body: Container(
        child: _bodyWidget(),
      ),
    );
  }

  Widget _bodyWidget() {
    return  Column(
      key: _bodyKey,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          color: Colors.white,
          child: TabBar(
            onTap: (index) {
              if (!mounted) {
                return;
              }
              setState(() {
                _index = index;
              });
              _pageController.jumpToPage(index);
            },
            isScrollable: false,
            controller: _tabController,
            labelStyle: TextStyles.textBoldDark14,
            indicatorSize: TabBarIndicatorSize.tab,
//                labelPadding: const EdgeInsets.only(left: 16.0),
            unselectedLabelColor: Colours.text_dark,
            labelColor: Colours.app_main,
            indicatorPadding:
            const EdgeInsets.only(left: 12.0, right: 36.0),
            tabs: <Widget>[
              Tab(
                child: Container(
//                      width: 100.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("巡检任务"),
                      Offstage(
                        offstage: _index != 0,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 1.0,
                          ),
                          child: Text(
                            "(9)",
                            style: TextStyle(fontSize: Dimens.font_sp12),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Tab(
                child: Container(
//                      width: 100.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("巡检记录"),
                      Offstage(
                        offstage: _index != 1,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 1.0),
                          child: Text(
                            "(67)",
                            style: TextStyle(fontSize: Dimens.font_sp12),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Gaps.line,
        Expanded(
            child: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
                onPageChanged: (index) {
                  if (_isPageCanChanged) {
                    _onPageChange(index);
                  }
                },
                controller: _pageController,
                itemBuilder: (BuildContext context, int index) {
                  if(index==0){
                    return InspectionTaskList();
                  }else{
                    return InspectionRecordList();
                  }
                }))
      ],
    );
  }

  _onPageChange(int index, {PageController p, TabController t}) async {
    if (p != null) {
      _isPageCanChanged = false;
      await _pageController.animateToPage(index,
          duration: Duration(milliseconds: 300), curve: Curves.ease);
      _isPageCanChanged = true;
    } else {
      _tabController.animateTo(index);
    }

    setState(() {
      _index = index;
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
    _pageController.dispose();
  }
}
