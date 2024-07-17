import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_giao_pro/app/constant.dart';
import 'package:wan_giao_pro/bean/article_item.dart';
import 'package:wan_giao_pro/compents/state_page.dart';
import 'package:wan_giao_pro/controller/collection_controller.dart';
import 'package:wan_giao_pro/controller/square_controller.dart';
import 'package:wan_giao_pro/event/message_event.dart';

class SquarePage extends StatefulWidget {
  RefreshController refreshController;

  SquarePage(this.refreshController);

  @override
  State<SquarePage> createState() => _SquarePageState();

}

class _SquarePageState extends State<SquarePage>
    with AutomaticKeepAliveClientMixin {
  late  StreamSubscription<MessageEvent> actionEventBus;
  SquareController? _squareController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _squareController=Get.put<SquareController>(SquareController());
    //2.0.0null safety版本，报错「Don't use one refreshController to multiple SmartRefresher,It will cause some unexpected bugs mostly in TabBarView」
    _squareController!.setRefreshController(widget.refreshController);
    actionEventBus = eventBus.on<MessageEvent>().listen((MessageEvent event) {
      if(event.type==Constant.REFRESH_PAGE){
        _squareController!.refresh();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    actionEventBus.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetX<SquareController>(
            builder: (SquareController squareController) {
              return SmartRefresher(
                  controller:squareController.refreshController!,
                  header: MaterialClassicHeader(),
                  footer: ClassicFooter(),
                  enablePullUp: true,
                  enablePullDown: true,
                  onRefresh: () async {
                    squareController.refresh();
                  },
                  onLoading: () async {
                    squareController.getSquareArticle(false);
                  },
                  child: _bodyStateWidget(squareController!));
            }));
  }

  _bodyStateWidget(SquareController controller) {
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
    } else if (controller.loadState.value == LoadState.SUCCESS||controller.loadState.value==LoadState.NO_MORE) {
      return ListView.separated(
          itemBuilder: (context, index) {
            ArticleItem articleItem = controller.articleItems[index];
            return Container(
              height: 100.h,
              child: InkWell(
                onTap: (){
                  Get.toNamed("/web_page",arguments: {
                    Constant.ARTICLE_TITLE:articleItem.title,
                    Constant.ARTICLE_URL:articleItem.link,
                    Constant.ARTICLE_AUTHOR:articleItem.author
                  });
                },
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          CollectionController collectionController =
                          Get.find<CollectionController>();
                          if (articleItem.collect ?? false) {
                            collectionController
                                .unCollectionArticle(articleItem.id.toString(),() {
                              articleItem.setCollect = false;
                              setState(() {});
                            }, (value) {
                              showToast(value);
                            });
                          } else {
                            collectionController
                                .collectArticle(articleItem.id.toString(), () {
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
                                    border:
                                        Border.all(color: Colors.red, width: 1),
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
          itemCount: controller.articleItems.length);
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
