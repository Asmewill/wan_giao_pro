import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_giao_pro/compents/state_page.dart';
import 'package:wan_giao_pro/controller/rank_controller.dart';

class RankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<RankController>(
        init: Get.put<RankController>(RankController()),
        initState: (_) {
          Get.find<RankController>().scrollController.addListener(() {
            Get.find<RankController>().offset.value =
                (Get.find<RankController>().scrollController.offset);
          });
          Get.find<RankController>()
              .setRefreshController(new RefreshController());
          Get.find<RankController>().getRankList(true);
        },
        builder: (RankController controller) {
          return SmartRefresher(
            controller: controller!.refreshController!,
            enablePullUp: true,
            enablePullDown: false,
            onLoading: () async {
              controller.getRankList(false);
            },
            child: CustomScrollView(
              controller: Get.find<RankController>().scrollController,
              slivers: [_buildTopUI(controller), _bodyStateWidget(controller)],
            ),
          );
        },
      ),
    );
  }

  _buildTopUI(RankController controller) {
    return SliverAppBar(
      title: controller.offset>120?Text("排行榜"):Container(),
      pinned: true,
      stretch: true,
      backgroundColor: Colors.green,
      brightness: Brightness.light,
      //状态栏的文字颜色为黑色
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Get.back();
        },
      ),
      elevation: 0.0,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: [StretchMode.fadeTitle, StretchMode.zoomBackground],
        background: Container(
          padding: EdgeInsets.only(top: ScreenUtil().statusBarHeight + 50.h),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.orange, Colors.orangeAccent, Colors.grey],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Center(
              child: controller.rankItems.length >= 3
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icon/ic_no_2.png",
                              width: 30,
                              height: 30,
                            ),
                            Text(
                              "${controller.rankItems[1].username}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            Text("${controller.rankItems[1].coinCount}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12))
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icon/ic_no_1.png",
                              width: 50,
                              height: 50,
                            ),
                            Text(
                              "${controller.rankItems[0].username}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            Text("${controller.rankItems[0].coinCount}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12))
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icon/ic_no_3.png",
                              width: 30,
                              height: 30,
                            ),
                            Text(
                              "${controller.rankItems[2].username}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            Text("${controller.rankItems[2].coinCount}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12))
                          ],
                        ),
                      ],
                    )
                  : Container()),
        ),
      ),
      expandedHeight: 180.h,
    );
  }

  _bodyStateWidget(RankController controller) {
    if (controller.loadState.value == LoadState.LOADING) {
      return SliverFillRemaining(
        child: LoadingPage(),
      );
    } else if (controller.loadState.value == LoadState.EMPTY) {
      return SliverFillRemaining(
        child: EmptyPage(
          onPressed: () {
            controller.refresh();
          },
        ),
      );
    } else if (controller.loadState.value == LoadState.FAILURE) {
      return SliverFillRemaining(
        child: NetWorkErrorPage(
            onPressed: () {
              controller.refresh();
            },
            errorMsg: "网络加载失败,请稍后重试!!!"),
      );
      //公众号Tab最后一列，没有更多数据 LoadState.NO_MORE
    } else if (controller.loadState.value == LoadState.SUCCESS ||
        controller.loadState.value == LoadState.NO_MORE) {
      return SliverList(
          delegate: SliverChildListDelegate(controller.rankItems
              .getRange(3, controller.rankItems.length)
              .map((rankItem) {
        return Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          height: 50,
          color: Colors.white,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 25,
                      height: 25,
                      child: Text(
                        rankItem.rank.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          rankItem.username.toString(),
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                        Text(rankItem.userId.toString(),
                            style: TextStyle(color: Colors.grey, fontSize: 13))
                      ],
                    )
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    child: Text(
                      rankItem.coinCount.toString(),
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ))
            ],
          ),
        );
      }).toList()));
    }
  }
}
