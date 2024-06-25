import 'package:oktoast/oktoast.dart';
import 'package:wan_giao_pro/base/base_getx_controller_with_refresh.dart';
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
        success: (dynamic value) {},
        failture: (dynamic value) {});
  }
}
