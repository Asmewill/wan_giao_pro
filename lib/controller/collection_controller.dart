import 'package:oktoast/oktoast.dart';
import 'package:wan_giao_pro/base/base_getx_controller.dart';
import 'package:wan_giao_pro/base/base_getx_controller_with_refresh.dart';
import 'package:wan_giao_pro/bean/article_data.dart';
import 'package:wan_giao_pro/bean/article_item.dart';
import 'package:wan_giao_pro/compents/state_page.dart';
import 'package:wan_giao_pro/http/http_manager.dart';
import 'package:get/get.dart';

class CollectionController extends BaseGetXControllerWithRefresh {
  int pageIndex = 0;

  var articleItems = <ArticleItem>[].obs;

  void collectArticle(String id, successful(), failed(String value)) {
    //此处回调了2个函数
    handlerRequest(HttpManager.instance.post("lg/collect/$id/json"), false,
        success: (dynamic value) {
      successful();
      // update();
    }, failture: (dynamic error) {
      failed(error);
    });
  }

  void unCollectionArticle(String id, successful(), failed(String value)) {
    handlerRequest(
        HttpManager.instance.post("lg/uncollect_originId/$id/json"), false,
        success: (dynamic value) {
          successful();
          // update();
        }, failture: (dynamic error) {
      failed(error);
    });
  }

  void getCollectionList(bool isShowLoading) {
    pageIndex = 0;
    handlerRequest(HttpManager.instance.get("lg/collect/list/$pageIndex/json"),
        isShowLoading, success: (dynamic value) {
      var result = ArticleData.fromJson(value).data;
      if (result == null) {
        return;
      }
      // num curPage = result!.curPage!;
      // num pageCount = result!.pageCount!;
      // if (pageIndex == 0) {
      //   articleItems.clear();
      // }
      //articleItems.value.addAll(result.datas!);//这样写导致页面不会刷新
      articleItems.clear();
      articleItems.addAll(result.datas!);
      loadState.value=LoadState.SUCCESS;
      // if (curPage ==1&& result.datas!.length == 0) {
      //   loadState.value = LoadState.EMPTY;
      // }
      // else if (curPage == pageCount) {
      //   loadState.value = LoadState.NO_MORE;
      //   refreshController!.loadNoData();
      // }
      // else {
      //   loadState.value = LoadState.SUCCESS;
      //   refreshController!.loadComplete();
      //   refreshController!.refreshCompleted(resetFooterState: true);
      //   pageIndex++;
      // }
    }, failture: (dynamic error) {
      refreshController!.loadFailed();
      refreshController!.refreshFailed();
      showToast(error);
    });
  }
}
