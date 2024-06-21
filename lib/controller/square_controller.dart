import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wan_giao_pro/base/base_getx_controller_with_refresh.dart';
import 'package:wan_giao_pro/bean/article_data.dart';
import 'package:wan_giao_pro/bean/article_item.dart';
import 'package:wan_giao_pro/compents/state_page.dart';
import 'package:wan_giao_pro/http/http_manager.dart';

class SquareController extends BaseGetXControllerWithRefresh {
  int pageIndex = 0;
  var articleItems = <ArticleItem>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initData(true);
  }

  void getSquareArticle(bool isShowLoading) {
    handlerRequest(
        HttpManager.instance.get("user_article/list/$pageIndex/json"), isShowLoading,
        success: (dynamic value) {
          var result=ArticleData.fromJson(value).data;
          if(result==null){
            return;
          }
          num curPage=result!.curPage!;
          num pageCount=result!.pageCount!;
          if(pageIndex==0){
            articleItems.clear();
          }
          //articleItems.value.addAll(result.datas!);//这样写导致页面不会刷新
          articleItems.addAll(result.datas!);
          if(curPage==0&&result.datas!.length==0){
            loadState.value=LoadState.EMPTY;
          }else if(curPage==pageCount){
            loadState.value=LoadState.NO_MORE;
            refreshController!.loadNoData();
          }else {
            loadState.value=LoadState.SUCCESS;
            refreshController!.loadComplete();
            refreshController!.refreshCompleted(resetFooterState: true);
            pageIndex++;
          }
    }, failture: (dynamic error) {
      refreshController!.refreshFailed();
      refreshController!.loadFailed();
      showToast(error);
    });
  }
  @override
  void initData(bool isShowLoading) {
    // TODO: implement initData
    super.initData(isShowLoading);
    getSquareArticle(isShowLoading);
  }

  @override
  void refresh() {
    // TODO: implement refresh
    super.refresh();
    pageIndex=0;
    getSquareArticle(true);
  }
}
