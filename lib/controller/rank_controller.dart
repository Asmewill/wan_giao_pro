
import 'package:flutter/cupertino.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wan_giao_pro/base/base_getx_controller_with_refresh.dart';
import 'package:wan_giao_pro/bean/coin_data.dart';
import 'package:wan_giao_pro/bean/rank_bean.dart';
import 'package:wan_giao_pro/bean/stars_leaderboadrd_data.dart';
import 'package:wan_giao_pro/compents/state_page.dart';
import 'package:get/get.dart';
import 'package:wan_giao_pro/http/http_manager.dart';

class RankController extends BaseGetXControllerWithRefresh {

  // int pageIndex = 1;
  // var rankItems = <RankItem>[].obs;
  // // ScrollController _scrollController = ScrollController();
  // //
  // // ScrollController get scrollController => _scrollController;
  // // double get offset => _offset.value;
  // // var _offset = 0.0.obs;
  // // void setOffset(double off) {
  // //   _offset.value = off;
  // // }
  //
  // void getRankList(bool isShowLoading) async{
  //   loadState.value = LoadState.SUCCESS;
  //   handlerRequest(
  //       HttpManager.instance.get("coin/rank/$pageIndex/json"), isShowLoading,
  //       success: (dynamic value) {
  //     var rankData = RankBean.fromJson(value).data;
  //     num pageCount = rankData!.pageCount!;
  //     num curPage = rankData!.curPage!;
  //     if (pageIndex == 1) {
  //       rankItems.clear();
  //     }
  //     rankItems.addAll(rankData!.datas!);
  //     if (pageIndex == 1 && rankItems.length == 0) {
  //       loadState.value = LoadState.EMPTY;
  //     } else if (curPage == pageCount) {
  //       loadState.value = LoadState.NO_MORE;
  //       refreshController!.loadNoData();
  //     } else {
  //       loadState.value = LoadState.SUCCESS;
  //       refreshController!.loadComplete();
  //       pageIndex++;
  //     }
  //     refreshController!.refreshCompleted(resetFooterState: true);
  //   }, failture: (dynamic errorMessage) {
  //     showToast(errorMessage);
  //     refreshController!.loadFailed();
  //     refreshController!.refreshFailed();
  //   });
  // }

  int pageIndex = 1;
  var _coins = <Coin>[].obs;

  List<Coin> get coins => _coins;
  var _offset = 0.0.obs;

  double get offset => _offset.value;
  ScrollController _scrollController = ScrollController();

  ScrollController get scrollController => _scrollController;

  void setOffset(double off) {
    _offset.value = off;
  }

  ///获取排行榜
  void getRankList(bool isShowLoading) {
    handlerRequest(
        HttpManager.instance.get("coin/rank/$pageIndex/json"), isShowLoading,success:
        (value) {
      var result = StarsLeaderboadrdData.fromJson(value).data;
      int curPage = result!.curPage;
      int pageCount = result.pageCount;
      if (curPage == 1) {
        //首页
        _coins.clear();
      }
      _coins.addAll(result.datas!);
      if (curPage == 1 && result.datas!.length == 0) {
        loadState.value = LoadState.EMPTY;
      } else if (curPage == pageCount) {
        loadState.value = LoadState.NO_MORE;
        refreshController!.loadNoData();
      } else {
        loadState.value = LoadState.SUCCESS;
        refreshController!.loadComplete();
        pageIndex++;
      }
      refreshController!.refreshCompleted(resetFooterState: true);
    }, failture: (errorMessage) {
      refreshController!.loadFailed();
      refreshController!.refreshFailed();
    });
  }

  @override
  void refresh() {
    pageIndex = 1;
    getRankList(false);
  }

  @override
  void initData(bool isShowLoading) {
    pageIndex = 1;
    getRankList(isShowLoading);
  }
}
