import 'package:wan_giao_pro/base/base_getx_controller.dart';
import 'package:wan_giao_pro/base/base_getx_controller_with_refresh.dart';
import 'package:wan_giao_pro/bean/article_data.dart';
import 'package:wan_giao_pro/bean/article_item.dart';
import 'package:wan_giao_pro/bean/wechat_bean.dart';
import 'package:wan_giao_pro/compents/state_page.dart';
import 'package:wan_giao_pro/http/http_manager.dart';
import 'package:wan_giao_pro/http/request_api.dart';
import 'package:get/get.dart';

class WechatController extends BaseGetXControllerWithRefresh {
  int pageIndex = 1;
  var wechatList = <WechatItem>[].obs;
  var articleList=<ArticleItem>[].obs;
  int iniItemIndex = 0;
  int authorId=0;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }

  void getTabList() async{
    handlerRequest(HttpManager.instance.get(RequestApi.WE_CHAT), true,
        success: (dynamic value) {
      WechatBean wechatBean = WechatBean.fromJson(value);
      wechatList.value=wechatBean.data!;
      loadState.value= wechatList.isEmpty?LoadState.EMPTY:LoadState.SUCCESS;
    }, failture: (dynamic value) {});
  }

  void getTabContent(bool isShowLoading) {
    handlerRequest(
        HttpManager.instance.get("wxarticle/list/$authorId/$pageIndex/json"),
        isShowLoading, success: (dynamic value) {
      ArticleResult? result = ArticleData.fromJson(value).data;

      num curPage=result!.curPage!;
      num pageCount=result!.pageCount!;
      if(pageIndex==0){
        articleList.clear();
      }
      //articleItems.value.addAll(result.datas!);//这样写导致页面不会刷新
      articleList.addAll(result.datas!);
      if(curPage==1&&result.datas!.length==0){
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
    }, failture: (dynamic value) {});
  }
  
  @override
  void refresh() {
    // TODO: implement refresh
    super.refresh();
    pageIndex=1;
    getTabContent(true);
  }


}
