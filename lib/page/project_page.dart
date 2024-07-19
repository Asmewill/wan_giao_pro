import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_giao_pro/compents/state_page.dart';
import 'package:wan_giao_pro/controller/project_controller.dart';
import 'package:wan_giao_pro/page/project_content_page.dart';

class ProjectPage extends StatefulWidget {
  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController? _tabController;
  ProjectController projectController =
      Get.put<ProjectController>(ProjectController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    projectController.getProjectTabs();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          brightness: Brightness.light,// 状态栏的文字颜色为黑色
          centerTitle: true,
          leading: null,
          title: Obx(() {
            return TabBar(
                isScrollable: true,
                controller: _tabController,
                tabs: projectController.projectList
                    .map((element) => Tab(
                  text: element.name,
                ))
                    .toList());
          })),
      body: GetX<ProjectController>(builder: (_) {
        _tabController = TabController(
            length: projectController.projectList.length,
            initialIndex: projectController.iniItemIndex,
            vsync: this);
        _tabController!.addListener(() {
          projectController.iniItemIndex = _tabController!.index;
        });
        return _bodyStateWidget(projectController);

      }),
    );
  }

  _bodyStateWidget(ProjectController controller) {
    if (controller.loadState.value == LoadState.LOADING) {
      return LoadingPage();
    } else if (controller.loadState.value == LoadState.EMPTY) {
      return EmptyPage(
        onPressed: () {
          controller.getProjectTabs();
        },
      );
    } else if (controller.loadState.value == LoadState.FAILURE) {
      return NetWorkErrorPage(
          onPressed: () {
            controller.getProjectTabs();
          },
          errorMsg: "网络加载失败,请稍后重试!!!");
      //公众号Tab最后一列，没有更多数据 LoadState.NO_MORE
    } else if (controller.loadState.value == LoadState.SUCCESS ||
        controller.loadState.value == LoadState.NO_MORE) {
      return TabBarView(
          controller: _tabController,
          children: projectController.projectList
              .map((element) =>
              ProjectContentPage(
                  element.id.toString(), RefreshController()))
              .toList());
    }
  }


  @override
  bool get wantKeepAlive => true;
}
