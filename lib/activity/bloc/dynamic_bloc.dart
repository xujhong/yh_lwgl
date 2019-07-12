import 'package:yh_lwgl/common/common.dart';
import 'package:yh_lwgl/presenter/post_presenter.dart';
import 'package:yh_lwgl/widgets/pull/gsy_pull_new_load_widget.dart';

/**
 * Created by guoshuyu
 * on 2019/3/23.
 */
class DynamicBloc {

  final GSYPullLoadWidgetControl pullLoadWidgetControl = new GSYPullLoadWidgetControl();

  int _page = 1;

  requestRefresh() async {
    pageReset();
    var res = await PostPresenter.ajaxQueryWdxxList(pageNum: _page, needDb: true);
    changeLoadMoreStatus(getLoadMoreStatus(res));
    refreshData(res);
    await doNext(res);
    return res;
  }

  requestLoadMore() async {
    pageUp();
    var res = await PostPresenter.ajaxQueryWdxxList(pageNum: _page);
    changeLoadMoreStatus(getLoadMoreStatus(res));
    loadMoreData(res);
    return res;
  }


  pageReset() {
    _page = 1;
  }

  pageUp() {
    _page++;
  }

  getLoadMoreStatus(res) {
    return (res != null && res.data != null && res.data.length == Constant.PAGE_SIZE);
  }

  doNext(res) async {
    if (res.next != null) {
      var resNext = await res.next;
      if (resNext != null && resNext.result) {
        changeLoadMoreStatus(getLoadMoreStatus(resNext));
        refreshData(resNext);
      }
    }
  }

  ///列表数据长度
  int getDataLength() {
    return pullLoadWidgetControl.dataList.length;
  }

  ///修改加载更多
  changeLoadMoreStatus(bool needLoadMore) {
    pullLoadWidgetControl.needLoadMore = needLoadMore;
  }

  ///是否需要头部
  changeNeedHeaderStatus(bool needHeader) {
    pullLoadWidgetControl.needHeader = needHeader;
  }

  ///刷新列表数据
  refreshData(res) {
    if (res != null) {
      pullLoadWidgetControl.dataList = res.data;
    }
  }

  ///加载更多数据
  loadMoreData(res) {
    if (res != null) {
      pullLoadWidgetControl.addList(res.data);
    }
  }

  ///清理数据
  clearData() {
    refreshData([]);
  }

  ///列表数据
  get dataList => pullLoadWidgetControl.dataList;

  void dispose() {
    pullLoadWidgetControl.dispose();
  }
}
