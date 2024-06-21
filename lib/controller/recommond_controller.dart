
import 'package:oktoast/oktoast.dart';
import 'package:wan_giao_pro/base/base_getx_controller_with_refresh.dart';
import 'package:wan_giao_pro/bean/article_data.dart';
import 'package:wan_giao_pro/bean/article_item.dart';
import 'package:wan_giao_pro/bean/banner_data.dart';
import 'package:wan_giao_pro/bean/top_article_data.dart';
import 'package:wan_giao_pro/compents/state_page.dart';
import 'package:wan_giao_pro/http/http_manager.dart';
import 'package:wan_giao_pro/http/request_api.dart';
import 'package:get/get.dart';



class RecommondController extends BaseGetXControllerWithRefresh {
  var bannerItems = <BannerItem>[].obs;
  var articleItems=<ArticleItem>[].obs;
  var topArticleItems=<ArticleItem>[].obs;
  int pageIndex = 0;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
   // getHomeBanner();
  //  getHomeArticle(true);
  //  getHomeTopArticle(true);
  }



  void getHomeBanner(bool showLoading) async{
    handlerRequest(HttpManager.instance.get(RequestApi.HOME_BANNER), showLoading,
        success: (dynamic value) {
      var items = BannerData.fromJson(value).data;
      this.bannerItems.value = items!;
      refreshController!.refreshCompleted(resetFooterState: true);
    }, failture: (dynamic exception) {});
  }

  void getHomeArticle(bool showLoading) async {
    handlerRequest(
        HttpManager.instance.get("article/list/$pageIndex/json"), showLoading,
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
          refreshController!.loadFailed();
          refreshController!.refreshFailed();
          showToast(error);
    });
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
     getHomeBanner(true);
     getHomeArticle(false);
     getHomeTopArticle(false);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void refresh() {
    // TODO: implement refresh
    super.refresh();
    pageIndex=0;
    getHomeBanner(true);
    getHomeArticle(false);
    getHomeTopArticle(false);
  }

  void getHomeTopArticle(bool showLoading) async{
    handlerRequest(
        HttpManager.instance.get(RequestApi.HOME_TOP), showLoading,
        success: (dynamic value) {
           topArticleItems.value=TopArticleData.fromJson(value).data!;
        }, failture: (dynamic error) {
      showToast(error);
    });

  }
}
