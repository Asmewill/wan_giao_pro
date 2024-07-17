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
          Get.find<RankController>()
              .setRefreshController(new RefreshController());
          Get.find<RankController>().scrollController.addListener(() {
            Get.find<RankController>()
                .setOffset(Get.find<RankController>().scrollController.offset);
          });
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
              slivers: [
                _buildTopUI(controller),
                _bodyStateWidget(controller, context)
              ],
            ),
          );
        },
      ),
    );
  }

  _buildTopUI(RankController controller) {
    return SliverAppBar(
      title: Text("排行榜"),
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
          child: Center(child: _buildTopContent(controller)),
        ),
      ),
      expandedHeight: 180.h,
    );
  }

  Widget _buildTopContent(RankController model) {
    return model.coins.length >= 3
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                LeaderBoardIcon(
                  icon: "assets/icon/ic_no_2.png",
                  iconSize: 40,
                  name: model.coins[1].username ?? "",
                  coins: model.coins[1].coinCount.toString(),
                ),
                LeaderBoardIcon(
                  icon: "assets/icon/ic_no_1.png",
                  iconSize: 55,
                  name: model.coins[0].username ?? "",
                  coins: model.coins[0].coinCount.toString(),
                ),
                LeaderBoardIcon(
                  icon: "assets/icon/ic_no_3.png",
                  iconSize: 40,
                  name: model.coins[2].username ?? "",
                  coins: model.coins[2].coinCount.toString(),
                ),
              ])
        : Container();
  }

  _bodyStateWidget(RankController controller, BuildContext context) {
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
          delegate: SliverChildListDelegate(
              controller.coins.getRange(3, controller.coins.length).map((e) {
        return ListTile(
            title: Text(e.username ?? "",
                style: TextStyle(
                    color: Theme.of(context).textTheme.headline3!.color)),
            subtitle: Text(e.userId.toString(),
                style: Theme.of(context).textTheme.subtitle1),
            trailing: Text(e.coinCount.toString(),
                style: Theme.of(context).textTheme.subtitle1),
            leading: Container(
                width: 30.w,
                alignment: Alignment.center,
                child: CircleAvatar(
                  child: Text(e.rank ?? ""),
                )));
      }).toList()));
    }
  }
}

class LeaderBoardIcon extends StatelessWidget {
  final String icon;
  final String name;
  final String coins;
  final double iconSize;
  final double textSize;

  LeaderBoardIcon(
      {Key? key,
      this.icon = "",
      this.name = "",
      this.coins = "",
      this.iconSize = 0.00,
      this.textSize = 12.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(icon, width: iconSize, height: iconSize),
        Text(name, style: TextStyle(fontSize: textSize, color: Colors.white)),
        Text(coins, style: TextStyle(fontSize: textSize, color: Colors.white))
      ],
    );
  }
}
