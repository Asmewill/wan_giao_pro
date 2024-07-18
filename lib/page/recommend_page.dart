import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_giao_pro/bean/article_item.dart';
import 'package:wan_giao_pro/bean/banner_data.dart';
import 'package:wan_giao_pro/app/constant.dart';
import 'package:wan_giao_pro/compents/extend_widget.dart';
import 'package:wan_giao_pro/compents/state_page.dart';
import 'package:wan_giao_pro/controller/collection_controller.dart';
import 'package:wan_giao_pro/controller/recommond_controller.dart';
import 'package:wan_giao_pro/event/message_event.dart';
import 'package:wan_giao_pro/theme/app_text.dart';

class RecommendPage extends StatefulWidget {
  RefreshController? refreshController;

  RecommendPage(this.refreshController);

  @override
  State<RecommendPage> createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage>
    with AutomaticKeepAliveClientMixin {
  RecommondController? _recommondController;
  late StreamSubscription<MessageEvent> actionEventBus;
  GlobalKey _refresherKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _recommondController = Get.put<RecommondController>(RecommondController());
    _recommondController!.setRefreshController(widget.refreshController!);
    actionEventBus = eventBus.on<MessageEvent>().listen((MessageEvent event) {
      if (event.type == Constant.REFRESH_PAGE) {
        _recommondController!.refresh();
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
    return Scaffold(body: GetX<RecommondController>(builder: (_) {
      try {
        return SmartRefresher(
            key: _refresherKey,
            controller: _recommondController!.refreshController!,
            header: WaterDropHeader(),
            enablePullUp: true,
            enablePullDown: true,
            onRefresh: () async {
              _recommondController!.refresh();
            },
            onLoading: () async {
              _recommondController!.getHomeArticle(false);
            },
            child: _bodyStateWidget(_recommondController!));
      } catch (e) {
        return LoadingPage();
      }
    }));
  }

  _bodyStateWidget(RecommondController controller) {
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
    } else if (controller.loadState.value == LoadState.SUCCESS ||
        controller.loadState.value == LoadState.NO_MORE) {
      return CustomScrollView(
        slivers: [
          _buildBannerUI(_recommondController!.bannerItems.value),
          _buildBoxGrid(),
          SliverToBoxAdapter(
            child: Line(),
          ),
          _buildTopArticleListUI(_recommondController!),
          _buildArticleListUI(_recommondController!),
        ],
      );
    }
  }

  _buildBannerUI(List<BannerItem> banners) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10.w),
        child: Container(
          height: 140.h,
          child: banners.length == 0
              ? null
              : Swiper(
                  itemBuilder: (context, index) {
                    return ClipRRect(
                        borderRadius: BorderRadius.circular(8.w),
                        child: InkWell(
                          child: CachedNetworkImage(
                            imageUrl: banners[index].imagePath ?? "",
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            fit: BoxFit.cover,
                          ),
                          onTap: () {
                            Get.toNamed("/web_page", arguments: {
                              Constant.ARTICLE_TITLE: banners[index].title,
                              Constant.ARTICLE_URL: banners[index].url,
                              Constant.ARTICLE_AUTHOR: ""
                            });
                          },
                        ));
                  },
                  itemCount: banners.length,
                  autoplay: true,
                  pagination: SwiperPagination(
                      alignment: Alignment.bottomRight,
                      builder:
                          DotSwiperPaginationBuilder(size: 8, activeSize: 8)),
                ),
        ),
      ),
    );
  }

  _buildBoxGrid() {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.all(10.w),
        child: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          //禁止滑动之后，解决CustomScrollView滑动冲突
          crossAxisCount: 4,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 0,
          shrinkWrap: true,
          children: KText.menusTexts.map((item) {
            return InkWell(
              onTap: () {
                // Get.toNamed("/news_page");
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Text(
                      item["menuTitle"]!,
                      style: TextStyle(color: Colors.white, fontSize: 20.sp),
                    ),
                  ),
                  Text(
                    item["menuName"]!,
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  _buildArticleListUI(RecommondController controller) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        ArticleItem articleItem = controller!.articleItems.value[index];
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
                        collectionController
                            .unCollectionArticle(articleItem.id.toString(), () {
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
                                border: Border.all(color: Colors.red, width: 1),
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
                          style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                        ),
                        Expanded(
                            child: Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(right: 10.w),
                          child: Text(
                            articleItem.niceDate ??
                                articleItem.niceShareDate ??
                                "",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 12.sp),
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
                          style: TextStyle(color: Colors.grey, fontSize: 12.sp),
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
      }, childCount: controller!.articleItems.length),
    );
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

  _buildTopArticleListUI(RecommondController controller) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        ArticleItem articleItem = controller!.topArticleItems.value[index];
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
                        collectionController
                            .unCollectionArticle(articleItem.id.toString(), () {
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
                            visible: true,
                            child: Opacity(//设置透明度为0，使控件不可见
                              opacity: 1,
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
                              ),
                            )),
                        Text(
                          getAuthor(articleItem) ?? "",
                          style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                        ),
                        Expanded(
                            child: Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(right: 10.w),
                          child: Text(
                            articleItem.niceDate ??
                                articleItem.niceShareDate ??
                                "",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 12.sp),
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
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(top: 5, right: 5),
                        child: Text(
                          "${articleItem.superChapterName}/${articleItem.chapterName}",
                          style: TextStyle(color: Colors.grey, fontSize: 12.sp),
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
      }, childCount: controller!.topArticleItems.length),
    );
  }
}
