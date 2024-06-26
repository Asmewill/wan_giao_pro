import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_giao_pro/bean/article_item.dart';
import 'package:wan_giao_pro/compents/extend_widget.dart';
import 'package:wan_giao_pro/compents/state_page.dart';
import 'package:wan_giao_pro/controller/square_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SquarePage extends StatefulWidget {
  @override
  State<SquarePage> createState() => _SquarePageState();
}

class _SquarePageState extends State<SquarePage> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetX<SquareController>(
            init: Get.find<SquareController>(),
            initState: (state) {
              Get.find<SquareController>().initData(true);
            },
            builder: (SquareController squareController) {
              return SmartRefresher(
                  controller: squareController!.refreshController!,
                  header: MaterialClassicHeader(),
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
    } else if (controller.loadState.value == LoadState.SUCCESS) {
      return ListView.separated(
          itemBuilder: (context, index) {
            ArticleItem articleItem = controller.articleItems[index];
            return Container(
              height: 100.h,
              child: InkWell(
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
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
                                    articleItem.niceDate??articleItem.niceShareDate??"",
                                    style:
                                    TextStyle(color: Colors.grey, fontSize: 12.sp),
                                  ),
                                ))
                          ],
                        ),
                        Expanded(
                            flex: 3,
                            child: Container(
                              padding: EdgeInsets.only(top: 5, right: 5),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                articleItem.title ?? "",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w900),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            )),
                        Expanded(
                          flex: 2,
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
