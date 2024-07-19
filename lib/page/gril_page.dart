import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_giao_pro/compents/state_page.dart';
import 'package:wan_giao_pro/controller/gril_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wan_giao_pro/page/gril_detail_page.dart';

class GrilPage extends GetView<GrilController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        //状态栏字体颜色为白色
        title: Text("Beautiful Gril"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        actions: [
          IconButton(
              onPressed: () {
                controller.isList.value = !controller.isList.value;
              },
              icon: Obx(() => controller.isList.value
                  ? Icon(Icons.view_module)
                  : Icon(Icons.menu)))
        ],
      ),
      body:Container(
        child:  _buildBodyContent(),
      ),
    );
  }

  _buildBodyContent() {
    return Obx(() {
      return SmartRefresher(
          controller: controller.refreshController!,
          header: MaterialClassicHeader(),
          footer: ClassicFooter(),
          enablePullUp: true,
          enablePullDown: true,
          onRefresh: () async {
            controller.refresh();
          },
          onLoading: () async {
            controller.getGrils(false);
          },
          child: _bodyStateWidget(controller!));
    });
  }

  _bodyStateWidget(GrilController controller) {
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
      if (controller.isList.value) {
        return ListView.builder(
            itemCount: controller.grilList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  child: Image.network(
                    controller.grilList[index].imageUrl??"",
                    fit: BoxFit.cover,
                    height: 200.h,
                  ),
                  elevation: 5,
                  clipBehavior: Clip.antiAlias,
                ),
                onTap: () {
                  Get.toNamed("/gril_detail_page");
                },
              );
            });
      } else {
        return GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount:controller.grilList.length,
            itemBuilder: (context, index) {
              return InkWell(
                child: Card(
                  child: CachedNetworkImage(
                    imageUrl:
                    controller.grilList[index].imageUrl??"",
                    fit: BoxFit.cover,
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 5,
                ),
                onTap: () {
                  Get.to(()=>{
                     GrilDetailPage()
                  });
                //  Get.toNamed("/gril_detail_page",arguments: {"imgUrl":controller.grilList[index].imageUrl??""});

                },
              );
            });
      }
    }
  }
}
