import 'package:oktoast/oktoast.dart';
import 'package:wan_giao_pro/base/base_getx_controller.dart';
import 'package:wan_giao_pro/base/base_getx_controller_with_refresh.dart';
import 'package:wan_giao_pro/bean/article_data.dart';
import 'package:wan_giao_pro/bean/article_item.dart';
import 'package:wan_giao_pro/compents/state_page.dart';
import 'package:wan_giao_pro/http/http_manager.dart';
import 'package:get/get.dart';

class PersonCollectController extends BaseGetXControllerWithRefresh {
  int pageIndex = 0;

  var articleItems = <ArticleItem>[].obs;


  void getCollectionList(bool isShowLoading) {
    pageIndex = 0;
    handlerRequest(HttpManager.instance.get("lg/collect/list/$pageIndex/json"),
        isShowLoading, success: (dynamic value) {
      var result = ArticleData.fromJson(value).data;
      if (result == null) {
        return;
      }
      num curPage = result!.curPage!;
      num pageCount = result!.pageCount!;
      if (pageIndex == 0) {
        articleItems.clear();
      }
      //articleItems.value.addAll(result.datas!);//这样写导致页面不会刷新
      articleItems.addAll(result.datas!);
      loadState.value=LoadState.SUCCESS;
      if (pageIndex ==0&& result.datas!.length == 0) {
        loadState.value = LoadState.EMPTY;
        refreshController!.refreshCompleted(resetFooterState: true);
      } else if (curPage == pageCount) {
        loadState.value = LoadState.NO_MORE;
        refreshController!.loadNoData();
        refreshController!.refreshCompleted(resetFooterState: true);
      } else {
        loadState.value = LoadState.SUCCESS;
        refreshController!.loadComplete();
        refreshController!.refreshCompleted(resetFooterState: true);
        pageIndex++;
      }
    }, failture: (dynamic error) {
      refreshController!.loadFailed();
      refreshController!.refreshFailed();
      showToast(error);
    });
  }

  void unCollectionArticle(String id, String originId, successful(), failed(String value)) {
    handlerRequest(
        HttpManager.instance.postFormData("lg/uncollect/$id/json", {"originId":originId}), false,
        success: (dynamic value) {
          successful();
          // update();
        }, failture: (dynamic error) {
      failed(error);
    });
  }

  @override
  void refresh() {
    // TODO: implement refresh
    super.refresh();
    pageIndex=0;
    getCollectionList(true);
  }
}
