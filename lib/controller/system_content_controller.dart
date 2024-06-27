import 'package:oktoast/oktoast.dart';
import 'package:wan_giao_pro/base/base_getx_controller_with_refresh.dart';
import 'package:wan_giao_pro/bean/article_data.dart';
import 'package:wan_giao_pro/bean/article_item.dart';
import 'package:get/get.dart';
import 'package:wan_giao_pro/compents/state_page.dart';
import 'package:wan_giao_pro/http/http_manager.dart';

class SystemContentController extends BaseGetXControllerWithRefresh {
  var articleItems = <ArticleItem>[].obs;
  int pageIndex = 0;
  String? cid;

  void getTabContent(bool isShowLoading) {
    handlerRequest(HttpManager.instance.get("article/list/$pageIndex/json?cid=$cid"), isShowLoading,
        success: (dynamic value) {
      var result = ArticleData.fromJson(value).data!;
      //当前页码
      num? curPage = result!.curPage;
      //总页数
      num? pageCount = result.pageCount;

      if (curPage == 1) {
        articleItems.clear();
      }
      //文章列表数据
      articleItems.addAll(result.datas!);
      if (curPage == 1 && result.datas!.length == 0) {
        loadState.value = LoadState.EMPTY;
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
    }, failture: (dynamic value) {
      refreshController!.loadFailed();
      refreshController!.refreshFailed();
      showToast(value);
    });
  }

  @override
  void refresh() {
    // TODO: implement refresh
    super.refresh();
    pageIndex=0;
    getTabContent(true);
  }
}
