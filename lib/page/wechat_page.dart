import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_giao_pro/controller/wechat_controller.dart';
import 'package:wan_giao_pro/page/wechat_content_page.dart';

class WeChatPage extends StatefulWidget {
  @override
  State<WeChatPage> createState() => _WeChatPageState();
}

class _WeChatPageState extends State<WeChatPage> with TickerProviderStateMixin,AutomaticKeepAliveClientMixin {
  TabController? _tabController;
  WechatController wechatController =
      Get.put<WechatController>(WechatController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wechatController.getTabList();

  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: wechatController.wechatList.length,
        child: Scaffold(
          appBar: AppBar(
              brightness: Brightness.dark,
              centerTitle: true,
              title: Obx(() {
                return TabBar(
                    isScrollable: true,
                    controller: _tabController,
                    tabs: wechatController.wechatList
                        .map((element) => Tab(
                              text: element.name,
                            ))
                        .toList());
              })),
          body:GetX<WechatController>(builder: (_){
            _tabController = TabController(
                length: wechatController.wechatList.length,
                initialIndex: wechatController.iniItemIndex,
                vsync: this);
            _tabController!.addListener(() {
              wechatController.iniItemIndex = _tabController!.index;
            });
            return TabBarView(
                controller: _tabController,
                children: wechatController.wechatList
                    .map((element) => WechatContentPage(element.id.toString(),RefreshController()))
                    .toList());
          }),
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

