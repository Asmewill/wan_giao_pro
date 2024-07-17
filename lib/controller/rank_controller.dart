import 'package:flutter/cupertino.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wan_giao_pro/base/base_getx_controller_with_refresh.dart';
import 'package:wan_giao_pro/bean/rank_bean.dart';
import 'package:wan_giao_pro/compents/state_page.dart';
import 'package:get/get.dart';
import 'package:wan_giao_pro/http/http_manager.dart';

class RankController extends BaseGetXControllerWithRefresh {

  var offset = 0.0.obs;
  int pageIndex = 1;
  var rankItems = <RankItem>[].obs;
  ScrollController scrollController = ScrollController();

  void getRankList(bool isShowLoading) {
    handlerRequest(
        HttpManager.instance.get("coin/rank/$pageIndex/json"), isShowLoading,
        success: (dynamic value) {
          var rankData = RankBean.fromJson(value).data;

          num pageCount = rankData!.pageCount!;
          num curPage = rankData.curPage!;
          if (pageIndex == 1) {
            rankItems.clear();
          }
          rankItems.addAll(rankData!.datas!);
          if (pageIndex == 1 && rankItems.length == 0) {
            loadState.value = LoadState.EMPTY;
            refreshController!.refreshCompleted(resetFooterState: true);
          } else if (curPage == pageCount) {
            refreshController!.refreshCompleted(resetFooterState: true);
            loadState.value = LoadState.NO_MORE;
            refreshController!.loadNoData();
          } else {
            loadState.value = LoadState.SUCCESS;
            refreshController!.refreshCompleted(resetFooterState: true);
            refreshController!.loadComplete();
            pageIndex++;
          }
        }, failture: (dynamic errorMessage) {
      showToast(errorMessage);
      refreshController!.loadFailed();
      refreshController!.refreshFailed();
    });
  }
}
