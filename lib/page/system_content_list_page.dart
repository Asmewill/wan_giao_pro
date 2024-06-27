import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_giao_pro/app/constant.dart';
import 'package:wan_giao_pro/bean/article_item.dart';
import 'package:wan_giao_pro/compents/state_page.dart';
import 'package:wan_giao_pro/controller/collection_controller.dart';
import 'package:wan_giao_pro/controller/system_content_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SystemContentListPage extends StatefulWidget {
  final String cid;
  RefreshController refreshController;

  SystemContentListPage(this.cid, this.refreshController);

  @override
  State<SystemContentListPage> createState() => _SystemContentListPageState();
}

class _SystemContentListPageState extends State<SystemContentListPage>
    with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<SystemContentController>(
      init: Get.put<SystemContentController>(SystemContentController(),
          tag: widget.cid),
      initState: (state) {
        Get.find<SystemContentController>(tag: widget.cid)
            .setRefreshController(widget.refreshController);
        Get.find<SystemContentController>(tag: widget.cid).cid = widget.cid;
        Get.find<SystemContentController>(tag: widget.cid).getTabContent(true);
      },
      builder: (_) {
        return _bodyStateWidget(
            Get.find<SystemContentController>(tag: widget.cid));
      },
    );
  }

  _bodyStateWidget(SystemContentController controller) {
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
      return SmartRefresher(
        controller:controller
            .refreshController!,
        enablePullUp: true,
        enablePullDown: true,
        onLoading: () {
          controller.getTabContent(false);
        },
        onRefresh: () {
          controller.refresh();
        },
        child: ListView.separated(
            itemBuilder: (context, index) {
              ArticleItem articleItem =
              controller.articleItems[index];
              return Container(
                height: 100.h,
                child: InkWell(
                  onTap: () {
                    Get.toNamed("/web_page", arguments: {
                      Constant.ARTICLE_TITLE: articleItem.title,
                      Constant.ARTICLE_URL: articleItem.link,
                      Constant.ARTICLE_AUTHOR: articleItem.author
                    });
                  },
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
            },
            separatorBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: 0.5.h,
                color: Colors.grey.withOpacity(0.2),
              );
            },
            itemCount: controller
                .articleItems
                .length),
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
  bool get wantKeepAlive => true;
}
