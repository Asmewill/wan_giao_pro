import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_giao_pro/compents/state_page.dart';
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

    return MediaQuery(data:  MediaQuery.of(context).copyWith(
      // 确保此处的brightness与你期望的状态栏文字颜色相符
      platformBrightness: Brightness.dark,
    ), child:  AnnotatedRegion(child: Scaffold(
      appBar: AppBar(
          brightness: Brightness.light,// 状态栏的文字颜色为黑色
          centerTitle: true,
          leading: null,
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
        return _bodyStateWidget(wechatController);
      }),
    ), value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark
    )));
  }


  _bodyStateWidget(WechatController controller) {
    if (controller.loadState.value == LoadState.LOADING) {
      return LoadingPage();
    } else if (controller.loadState.value == LoadState.EMPTY) {
      return EmptyPage(
        onPressed: () {
          controller.getTabList();
        },
      );
    } else if (controller.loadState.value == LoadState.FAILURE) {
      return NetWorkErrorPage(
          onPressed: () {
            controller.getTabList();
          },
          errorMsg: "网络加载失败,请稍后重试!!!");
      //公众号Tab最后一列，没有更多数据 LoadState.NO_MORE
    } else if (controller.loadState.value == LoadState.SUCCESS ||
        controller.loadState.value == LoadState.NO_MORE) {
      return TabBarView(
          controller: _tabController,
          children: controller.wechatList
              .map((element) =>
              WechatContentPage(
                  element.id.toString(), RefreshController()))
              .toList());
    }
  }


  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

