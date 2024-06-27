import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_giao_pro/app/constant.dart';
import 'package:wan_giao_pro/bean/system_bean.dart';
import 'package:wan_giao_pro/page/system_content_list_page.dart';

class SystemContentPage extends StatefulWidget {
  @override
  State<SystemContentPage> createState() => _SystemContentPageState();
}

class _SystemContentPageState extends State<SystemContentPage>
    with TickerProviderStateMixin ,AutomaticKeepAliveClientMixin{
  TabController? tabController;

  SystemItem? systemItem;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    int initIndex = Get.arguments[Constant.TAB_INDEX];
    systemItem = Get.arguments[Constant.TAB_BEAN];
    tabController = TabController(
        length: systemItem!.children!.length,
        vsync: this,
        initialIndex: initIndex);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: systemItem!.children!.length,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(systemItem!.name!),
            bottom: TabBar(
              isScrollable: true,
              tabs: systemItem!.children!
                  .map((e) => Tab(
                        text: e.name,
                      ))
                  .toList(),
              controller: tabController,
            ),
          ),
          body: TabBarView(
             controller: tabController,
              children: systemItem!.children!.map((e) {
            return SystemContentListPage(e.id.toString(),RefreshController());
          }).toList()),
        ));
  }

  @override
  bool get wantKeepAlive => true;


}
