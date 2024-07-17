import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_giao_pro/bean/point_bean.dart';
import 'package:wan_giao_pro/compents/state_page.dart';
import 'package:wan_giao_pro/controller/point_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PointPage extends StatefulWidget {
  @override
  State<PointPage> createState() => _PointPageState();
}

class _PointPageState extends State<PointPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("积分明细",style: TextStyle(fontSize: 16),),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: GetX<PointController>(
          init: Get.put<PointController>(PointController()),
          initState: (_) {
            Get.find<PointController>()
                .setRefreshController(new RefreshController());
            Get.find<PointController>().getPointList(true);
          },
          builder: (PointController personCollectController) {
            return SmartRefresher(
                controller: personCollectController.refreshController!,
                header: MaterialClassicHeader(),
                footer: ClassicFooter(),
                enablePullUp: true,
                enablePullDown: true,
                onRefresh: () async {
                  personCollectController.refresh();
                },
                onLoading: () async {
                  personCollectController.getPointList(false);
                },
                child: _bodyStateWidget(personCollectController!));
          }),
    );
  }

  _bodyStateWidget(PointController controller) {
    if (controller.loadState.value == LoadState.LOADING) {
      return LoadingPage();
    } else if (controller.loadState.value == LoadState.EMPTY) {
      return EmptyPage(
        onPressed: () {
          controller.refresh();
        },
      );
    } else if (controller.loadState.value == LoadState.FAILURE) {
      return NetWorkErrorPage(
          onPressed: () {
            controller.refresh();
          },
          errorMsg: "网络加载失败,请稍后重试!!!");
      //公众号Tab最后一列，没有更多数据 LoadState.NO_MORE
    } else if (controller.loadState.value == LoadState.SUCCESS ||
        controller.loadState.value == LoadState.NO_MORE) {
      return ListView.builder(
          itemCount: controller.pointItems.length,
          itemBuilder: (context, index) {
            PointItem pointItem=controller.pointItems[index];
              return Container(
                height: 50.h,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 15,right: 15),
                child: Text("${pointItem.desc}",overflow: TextOverflow.ellipsis,),
                decoration:BoxDecoration(
                  color: Colors.white,
                  border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.2),width: 0.5.w))
                ),
              );
          });
    }
  }
}
