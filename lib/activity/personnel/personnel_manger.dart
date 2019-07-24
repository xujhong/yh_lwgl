import 'package:flutter/material.dart';
import 'package:yh_lwgl/activity/personnel/personnel_manger_list.dart';
import 'package:yh_lwgl/activity/personnel/personnel_manger_tzzylist.dart';
import 'package:yh_lwgl/res/colors.dart';
import 'package:yh_lwgl/res/dimens.dart';
import 'package:yh_lwgl/res/styles.dart';

///人员管理
///
class PersonnelManger extends StatefulWidget {
  @override
  _personnelMaingerState createState() => _personnelMaingerState();
}

class _personnelMaingerState extends State<PersonnelManger>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _tabController;
  PageController _pageController = PageController(initialPage: 0);
  bool _isPageCanChanged = true;
  GlobalKey _bodyKey = GlobalKey();

  //当前在哪个Tab
  var _index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {}),
//            IconButton(
//                icon: Icon(
//                  Icons.add,
//                  color: Colors.white,
//                ),
//                onPressed: () {}),
          ],
          title: Text("人员管理"),
        ),
        body: Column(
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
                          Text("三类人员"),
                          Offstage(
                            offstage: _index != 0,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 1.0,
                              ),
                              child: Text(
                                "(10)",
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
                          Text("特种作业人员"),
                          Offstage(
                            offstage: _index != 1,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 1.0),
                              child: Text(
                                "(15)",
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
                        return PersonnelMangerList(index: index);
                      }else{
                        return PersonnelMangerTzzyList(index: index);
                      }
                    }))
          ],
        ));
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
}
