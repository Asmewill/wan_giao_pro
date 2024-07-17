
import 'package:wan_giao_pro/base/base_getx_controller_with_refresh.dart';
import 'package:wan_giao_pro/bean/point_bean.dart';
import 'package:wan_giao_pro/compents/state_page.dart';
import 'package:wan_giao_pro/http/http_manager.dart';
import 'package:get/get.dart';

class PointController extends BaseGetXControllerWithRefresh {
  var pointItems = <PointItem>[].obs;

  int pageIndex = 1;

  void getPointList(bool isShowLoading) {
    handlerRequest(
        HttpManager.instance.get("lg/coin/list/$pageIndex/json"), isShowLoading,
        success: (value) {
      var pointData = PointBean.fromJson(value).data;
      num pageCount = pointData!.pageCount!;
      num curPage = pointData.curPage!;
      if (pageIndex == 1) {
        pointItems.clear();
      }
      pointItems.addAll(pointData!.datas!);
      if (pageIndex == 1 && pointItems.length == 0) {
        loadState.value = LoadState.EMPTY;
        refreshController!.refreshCompleted(resetFooterState: true);
      } else if (curPage == pageCount) {
        refreshController!.refreshCompleted(resetFooterState: true);
        loadState.value = LoadState.NO_MORE;
        refreshController!.loadNoData();
      } else {
        loadState.value = LoadState.SUCCESS;
        refreshController!.refreshCompleted(resetFooterState: true);
        refreshController!.loadComplete();
        pageIndex++;
      }

    }, failture: (errorMessage) {
      refreshController!.loadFailed();
      refreshController!.refreshFailed();
    });
  }
  @override
  void refresh() {
    // TODO: implement refresh
    super.refresh();
    pageIndex=1;
    getPointList(false);
  }
}
