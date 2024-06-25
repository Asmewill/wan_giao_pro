import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_giao_pro/bean/article_item.dart';
import 'package:wan_giao_pro/compents/state_page.dart';
import 'package:wan_giao_pro/controller/collection_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wan_giao_pro/controller/wechat_controller.dart';

class WechatContentPage extends StatefulWidget {
  final String id;
  RefreshController refreshController;

  WechatContentPage(this.id, this.refreshController);

  @override
  State<WechatContentPage> createState() => _WechatContentPageState();
}

class _WechatContentPageState extends State<WechatContentPage>
    with AutomaticKeepAliveClientMixin {
  //WechatController? wechatController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // wechatController =
    //     Get.put<WechatController>(WechatController(), tag: widget.id);

  }

  @override
  Widget build(BuildContext context) {
    return GetX<WechatController>(
        init: Get.put<WechatController>(WechatController(), tag: widget.id),
        initState: (state) {
          Get.find<WechatController>(tag: widget.id).authorId = int.parse(widget.id);
          Get.find<WechatController>(tag: widget.id).setRefreshController(widget.refreshController);
          Get.find<WechatController>(tag: widget.id).getTabContent(true);
    }, builder: (_) {
      return _bodyStateWidget( Get.find<WechatController>(tag: widget.id));
    });
  }

  _bodyStateWidget(WechatController controller) {
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
    } else if (controller.loadState.value == LoadState.SUCCESS||controller.loadState.value==LoadState.NO_MORE) {
      return SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        onLoading: () {
          controller!.getTabContent(false);
        },
        onRefresh: () {
          controller!.refresh();
        },
        controller: controller!.refreshController!,
        child: ListView.builder(
            itemCount: controller!.articleList.length,
            itemBuilder: (context, index) {
              ArticleItem articleItem = controller!.articleList[index];
              return Container(
                height: 100.h,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.2), width: 0.5.w))
                ),
                child: InkWell(
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            CollectionController collectionController =
                            Get.find<CollectionController>();
                            if (articleItem.collect ?? false) {
                              collectionController.unCollectionArticle(
                                  articleItem.id.toString(), () {
                                articleItem.setCollect = false;
                                setState(() {});
                              }, (value) {
                                showToast(value);
                              });
                            } else {
                              collectionController.collectArticle(
                                  articleItem.id.toString(), () {
                                articleItem.setCollect = true;
                                showToast("收藏成功");
                                setState(() {});
                              }, (value) {
                                showToast(value);
                              });
                            }
                          },
                          icon: articleItem.collect ?? false
                              ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                              : Icon(
                            Icons.favorite_border,
                          )),
                      Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Visibility(
                                      visible: false,
                                      child: Container(
                                        margin: EdgeInsets.only(right: 10.w),
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(
                                              color: Colors.red, width: 1),
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        padding: EdgeInsets.only(
                                            left: 2, right: 2, top: 1, bottom: 1),
                                        child: Text(
                                          "置顶",
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 14.sp),
                                        ),
                                      )),
                                  Text(
                                    getAuthor(articleItem) ?? "",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12.sp),
                                  ),
                                  Expanded(
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        margin: EdgeInsets.only(right: 10.w),
                                        child: Text(
                                          articleItem.niceDate ??
                                              articleItem.niceShareDate ??
                                              "",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 12.sp),
                                        ),
                                      ))
                                ],
                              ),
                              Expanded(
                                  flex: 30,
                                  child: Container(
                                    padding: EdgeInsets.only(top: 5, right: 5),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      articleItem.title ?? "",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.w900,
                                          height: 1.3),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  )),
                              Expanded(
                                flex: 15,
                                child: Container(
                                  padding: EdgeInsets.only(top: 5, right: 5),
                                  child: Text(
                                    "${articleItem.superChapterName}/${articleItem.chapterName}",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12.sp),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              );
            }),
      );
    }
  }

  String? getAuthor(ArticleItem articleItem) {
    String? author = "";
    if (articleItem.author != null && articleItem.author!.length > 0) {
      author = articleItem.author!;
    } else {
      author = articleItem.shareUser;
    }
    return author;
  }

  @override
// TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
