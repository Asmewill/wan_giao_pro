import 'package:oktoast/oktoast.dart';
import 'package:wan_giao_pro/base/base_getx_controller_with_refresh.dart';
import 'package:wan_giao_pro/bean/article_data.dart';
import 'package:wan_giao_pro/bean/article_item.dart';
import 'package:wan_giao_pro/bean/project_bean.dart';
import 'package:wan_giao_pro/compents/state_page.dart';
import 'package:wan_giao_pro/http/http_manager.dart';
import 'package:wan_giao_pro/http/request_api.dart';
import 'package:get/get.dart';

class ProjectController extends BaseGetXControllerWithRefresh {
  var loadState = LoadState.DONE.obs;
  var projectList = <ProjectItem>[].obs;
  int pageIndex = 0;
  int cid = 0;
  var articleList=<ArticleItem>[].obs;
  int iniItemIndex=0;

  @override
  void onInit() {
    super.onInit();
    getProjectTabs();
  }

  @override
  void onRefresh() {
    getProjectTabs();
  }

  ///获取项目的分类
  getProjectTabs() async {
    handlerRequest(HttpManager.instance.get(RequestApi.PROJECT_TREE_API), true,
        success: (dynamic value) {
      projectList.value = ProjectBean.fromJson(value).data!;
      loadState.value =
          projectList.isEmpty ? LoadState.EMPTY : LoadState.SUCCESS;
    }, failture: (dynamic value) {
      showToast(value);
    });
  }

  getProjectList(bool isShowLoading) {
    handlerRequest(
        HttpManager.instance
            .get("project/list/$pageIndex/json", queryParams: {"cid": cid}),
        isShowLoading,
        success: (dynamic value) {
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

        },
        failture: (dynamic value) {
          refreshController!.refreshFailed();
          refreshController!.loadFailed();
          showToast(value);
        });
  }
}
