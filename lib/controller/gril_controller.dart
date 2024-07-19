import 'package:oktoast/oktoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_giao_pro/base/base_getx_controller_with_refresh.dart';
import 'package:wan_giao_pro/bean/gril_bean.dart';
import 'package:wan_giao_pro/compents/state_page.dart';
import 'package:get/get.dart';
import 'package:wan_giao_pro/http/http_manager.dart';
import 'package:wan_giao_pro/http/request_api.dart';

class GrilController extends BaseGetXControllerWithRefresh {
  var isList = false.obs;
  int pageIndex = 1;
  var grilList = <GrilItem>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    setRefreshController(RefreshController(initialRefresh: false));
    getGrils(true);

  }

  void getGrils(bool isShowLoading) {
    handlerRequest(
        HttpManager.instance.get("",
            newUrl: RequestApi.QUERY_GIRLS_API,
            queryParams: {"page": pageIndex}),
        isShowLoading, success: (dynamic value) {
      var result = GrilBean.fromJson(value);
      if (pageIndex == 1) {
        grilList.clear();
      }
      grilList.addAll(result.data!);
      if (pageIndex == 1 && grilList.length == 0) {
        loadState.value = LoadState.EMPTY;
      } else if (pageIndex == 10) {
        loadState.value = LoadState.NO_MORE;
        refreshController!.loadNoData();
      } else {
        loadState.value = LoadState.SUCCESS;
        refreshController!.loadComplete();
        pageIndex++;
      }
      refreshController!.refreshCompleted(resetFooterState: true);
    }, failture: (dynamic error) {
      refreshController!.loadFailed();
      refreshController!.refreshFailed();
      showToast(error);
    });
  }

  @override
  void refresh() {
    // TODO: implement refresh
    super.refresh();
    pageIndex = 1;
    getGrils(true);
  }
}
