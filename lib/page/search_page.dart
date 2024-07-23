import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_giao_pro/app/constant.dart';
import 'package:wan_giao_pro/bean/article_item.dart';
import 'package:wan_giao_pro/compents/search_view.dart';
import 'package:wan_giao_pro/compents/state_page.dart';
import 'package:wan_giao_pro/controller/collection_controller.dart';
import 'package:wan_giao_pro/controller/search_controller.dart';
import 'package:wan_giao_pro/dialog/remind_dialog.dart';

class SearchPage extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return GetX(
        init: controller,
        initState: (_) {
          controller.getSearchHotKey();
        },
        builder: (_) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size(ScreenUtil().screenWidth, 50.h),
              child: Container(
                height: double.infinity,
                padding: EdgeInsets.only(
                    top: ScreenUtil().statusBarHeight, left: 10.w),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.only(left: 10.w),
                      height: 36.h,
                      alignment: Alignment.centerLeft,
                      child: SearchView(
                        queryHint: "请输入关键字",
                        enable: true,
                        suffixIcon: Icons.cancel,
                        textEditingController: controller.textEditingController,
                        changed: (value) {
                          if (value.isEmpty) {
                            // controller.setSearching(false);
                          }
                        },
                        onPressed: () {
                          controller.textEditingController!.clear();
                          controller.setSearching(false);
                        },
                        submit: (value) {
                          controller.setQueryKey(value);
                          controller.setSearching(true);
                        },
                        backgroundColor: Colors.grey.withOpacity(0.5),
                      ),
                    )),
                    Container(
                      width: 50.w,
                      alignment: Alignment.center,
                      child: TextButton(
                          onPressed: () {
                            controller.textEditingController!.text = "";
                            if (controller.isSearching.value) {
                              controller.isSearching.value = false;
                            } else {
                              Get.back();
                            }
                          },
                          child: Text(
                            "取消",
                            style: TextStyle(color: Colors.black),
                          )),
                    )
                  ],
                ),
              ),
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 0.h,
                      ),
                      _buildHotSearchUiList(),
                      _buildHistoryUiList(context)
                    ],
                  ),
                ),
                controller.isSearching.value
                    ? SearchResultPage(controller)
                    : Container()
              ],
            ),
          );
        });
  }

  _buildHotSearchUiList() {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 10.w, top: 5.h, bottom: 5.h),
      child: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "热门搜索",
              style: TextStyle(fontSize: 14.sp),
            ),
            SizedBox(
              height: 5.h,
            ),
            Wrap(
              spacing: 10.w,
              children: controller.hotItems.map((element) {
                return ActionChip(
                    label: Text(element.name ?? ""),
                    backgroundColor: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                    onPressed: () {
                      controller.setQueryKey(element.name ?? "");
                      controller.setSearching(true);
                      controller.textEditingController!.text =
                          element.name ?? "";
                      controller.textEditingController!.selection =
                          TextSelection.collapsed(
                              offset: (element.name ?? "").length);
                    });
              }).toList(),
            )
          ],
        );
      }),
    );
  }

  _buildHistoryUiList(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 10.w, top: 5.h, bottom: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "历史记录",
                style: TextStyle(fontSize: 14.sp),
              ),
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  height: 30.h,
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    "删除",
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return RemindDialog("提示", "确定删除所有历史记录吗?", () {
                          controller!.cleanAllHistory();
                          Navigator.of(context).pop();
                        });
                      });
                },
              )
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Wrap(
            spacing: 10.w,
            children: controller.searchHistory.map((element) {
              return ActionChip(
                  label: Text(element),
                  backgroundColor: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                  onPressed: () {
                    controller.setQueryKey(element ?? "");
                    controller.setSearching(true);
                    controller.textEditingController!.text = element ?? "";
                    controller.textEditingController!.selection =
                        TextSelection.collapsed(offset: (element ?? "").length);
                  });
            }).toList(),
          )
        ],
      ),
    );
  }

  Widget? _buildSuffixIcon({required pressed()}) {
    return Obx(() {
      if (controller.showClearIcon.value) {
        return IconButton(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 8.w),
            iconSize: 18,
            icon: Icon(
              Icons.cancel,
              color: Colors.grey,
            ),
            onPressed: () {
              pressed();
            });
      } else {
        return Container();
      }
    });
  }
}

class SearchResultPage extends StatefulWidget {
  SearchController searchController;

  SearchResultPage(this.searchController);

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
        child: Scaffold(
          body: GetX(
            init: widget.searchController,
            initState: (state) {
              widget.searchController
                  .setRefreshController(new RefreshController());
              widget.searchController!.initData(true);
            },
            builder: (_) {
              return SmartRefresher(
                  controller: widget.searchController!.refreshController!,
                  header: MaterialClassicHeader(),
                  footer: ClassicFooter(),
                  enablePullUp: true,
                  enablePullDown: false,
                  onRefresh: () async {},
                  onLoading: () async {
                    widget.searchController!.loadArticleBySearchKey(false);
                  },
                  child: _bodyStateWidget(widget.searchController!));
            },
          ),
        ),
        onWillPop: () async {
          // 返回键被按下时执行的操作
          //showToast('返回键被按下');
          widget.searchController.isSearching.value = false;
          widget.searchController.textEditingController!.text = "";
          // 返回 false 表示忽略返回键事件
          // 返回 true 表示允许默认的返回键行为
          return false;
        });
  }

  _bodyStateWidget(SearchController controller) {
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
      return ListView.separated(
          itemBuilder: (context, index) {
            ArticleItem articleItem =
                widget.searchController!.articleItems[index];
            return Container(
              height: 100.h,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.grey.withOpacity(0.4), width: 0.2.h))),
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
          itemCount: widget.searchController!.articleItems.length);
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
}
