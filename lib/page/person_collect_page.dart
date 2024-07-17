import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_giao_pro/bean/article_item.dart';
import 'package:wan_giao_pro/compents/state_page.dart';
import 'package:wan_giao_pro/controller/collection_controller.dart';
import 'package:wan_giao_pro/controller/person_collect_controller.dart';

class PersonCollectPage extends StatefulWidget {
  @override
  State<PersonCollectPage> createState() => _PersonCollectPageState();
}

class _PersonCollectPageState extends State<PersonCollectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "收藏",
          style: TextStyle(fontSize: 16),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back)),
        centerTitle: true,
      ),
      body: GetX<PersonCollectController>(
          init: Get.put<PersonCollectController>(PersonCollectController()),
          initState: (_) {
            Get.find<PersonCollectController>()
                .setRefreshController(new RefreshController());
            Get.find<PersonCollectController>().getCollectionList(true);
          },
          builder: (PersonCollectController personCollectController) {
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
                  personCollectController.getCollectionList(false);
                },
                child: _bodyStateWidget(personCollectController!));
          }),
    );
  }

  _bodyStateWidget(PersonCollectController controller) {
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
          itemCount: controller!.articleItems.length,
          itemBuilder: (context, index) {
            ArticleItem item = controller.articleItems[index];
            return Container(
              height: 120.h,
              margin: EdgeInsets.only(
                  left: 5.w, top: 2.5.h, right: 5.w, bottom: 2.5.h),
              child: Slidable( actionPane: SlidableDrawerActionPane(),actionExtentRatio:0.35,
                secondaryActions: [
                  IconSlideAction(
                    caption: "Delete",
                    color: Colors.red,
                    icon: Icons.delete,
                    onTap: (){
                      controller.unCollectionArticle(
                          item.id.toString(), item.originId.toString(),() => {
                        setState(() {
                          controller.articleItems.remove(item);
                        })
                      }, (value) => {

                      });
                    },
                  )
                ],
                child: Card(
                  child: InkWell(
                    onTap: () {
                      showToast("msg");
                    },
                    child: Container(
                      //   color: Colors.white,//水波纹失效
                      padding: EdgeInsets.all(10.w),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${getAuthor(item)}",
                                style:
                                TextStyle(color: Colors.black, fontSize: 13.sp),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time_outlined,
                                    color: Colors.grey,
                                    size: 20.w,
                                  ),
                                  Text(
                                    "${item.niceDate}",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 13.sp),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5.h),
                            alignment: Alignment.centerLeft,
                            height: 40.h,
                            child: Text(
                              "${item.title}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 13.sp,
                                  height: 1.3),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.only(top: 5.h),
                            child: InkWell(
                              child: Icon(
                                Icons.delete,
                                color: Colors.grey,
                              ),
                              onTap: () {
                                controller.unCollectionArticle(
                                    item.id.toString(), item.originId.toString(),() => {
                                  setState(() {
                                    controller.articleItems.remove(item);
                                  })
                                }, (value) => {});
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  )),),
            );
          });
    }
  }

  String? getAuthor(ArticleItem articleItem) {
    String? author = "";
    if (articleItem.author != null && articleItem.author!.length > 0) {
      author = articleItem.author!;
    } else {
      author = articleItem.shareUser;
    }
    return author ?? "无名";
  }
}
