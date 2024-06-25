import 'package:oktoast/oktoast.dart';
import 'package:wan_giao_pro/base/base_getx_controller_with_refresh.dart';
import 'package:wan_giao_pro/bean/question_bean.dart';
import 'package:wan_giao_pro/compents/state_page.dart';
import 'package:wan_giao_pro/http/http_manager.dart';
import 'package:get/get.dart';

class QuestionController extends BaseGetXControllerWithRefresh {
  int pageIndex = 1;
  var questionItems = <QuestionItem>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }

  void getQuestion(bool isShowLoading) {
    handlerRequest(
        HttpManager.instance.get("wenda/list/$pageIndex/json"), isShowLoading,
        success: (dynamic value) {
      var result = QuestionBean.fromJson(value).data;
      if (result == null) {
        return;
      }
      num curPage = result!.curPage!;
      num pageCount = result!.pageCount!;
      if (pageIndex == 0) {
        questionItems.clear();
      }
      //articleItems.value.addAll(result.datas!);//这样写导致页面不会刷新
      questionItems.addAll(result.datas!);
      if (curPage == 1&& result.datas!.length == 0) {
        loadState.value = LoadState.EMPTY;
      } else if (curPage == pageCount) {
        loadState.value = LoadState.NO_MORE;
        refreshController!.loadNoData();
      } else {
        loadState.value = LoadState.SUCCESS;
        refreshController!.loadComplete();
        refreshController!.refreshCompleted(resetFooterState: true);
        pageIndex++;
      }
    }, failture: (dynamic error) {
      showToast(error.toString());
      refreshController!.loadFailed();
      refreshController!.refreshFailed();
    });
  }

  @override
  void refresh() {
    // TODO: implement refresh
    super.refresh();
    pageIndex=1;
    getQuestion(true);
  }
}
