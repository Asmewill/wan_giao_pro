

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sp_util/sp_util.dart';
import 'package:wan_giao_pro/app/constant.dart';
import 'package:wan_giao_pro/base/base_getx_controller_with_refresh.dart';
import 'package:wan_giao_pro/bean/article_data.dart';
import 'package:wan_giao_pro/bean/article_item.dart';
import 'package:wan_giao_pro/bean/hot_bean.dart';
import 'package:wan_giao_pro/compents/state_page.dart';
import 'package:wan_giao_pro/http/http_manager.dart';

class SearchController extends BaseGetXControllerWithRefresh{

  var searchHistory=<String>[].obs;
  var queryKey="";
  var hotItems=<HotItem>[].obs;
  var isSearching=false.obs;
  var showClearIcon=false.obs;
  TextEditingController? textEditingController;
  int pageIndex=0;

  var articleItems=<ArticleItem>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    textEditingController = TextEditingController();
    searchHistory.value=SpUtil.getStringList(Constant.KEY_SEARCH_HISTORY,defValue:[])!;

  }
  void setSearching(bool searching){
    this.isSearching.value=searching;
  }

  void setQueryKey(String keyWords){
    var historyList=SpUtil.getStringList(Constant.KEY_SEARCH_HISTORY,defValue:[]);
    if(!historyList!.contains(keyWords)){
      historyList.add(keyWords);
    }
    SpUtil.putStringList(Constant.KEY_SEARCH_HISTORY, historyList);
    searchHistory.value=historyList;
    queryKey=keyWords;
  }
  void getSearchHotKey(){
    handlerRequest(HttpManager.instance.get("hotkey/json"), true,success: (dynamic  value){
      hotItems.value=HotBean.fromJson(value).data!;
    },failture: (value){
      showToast(value);
    });
  }

  @override
  void initData(bool isShowLoading) {
    // TODO: implement initData
    super.initData(isShowLoading);
    pageIndex=0;
    loadArticleBySearchKey(true);
  }

  void loadArticleBySearchKey(bool isShowLoading) {
    handlerRequest(
        HttpManager.instance.post(
          "article/query/$pageIndex/json?k=$queryKey",
        ),
        isShowLoading, success: (value) {
      var result = ArticleData.fromJson(value).data;
      //当前页码
      num? curPage = result!.curPage;
      //总页数
      num? pageCount = result.pageCount;

      if (curPage == 1) {
        articleItems.clear();
      }
      //文章列表数据
      articleItems.addAll(result.datas!);
      if (curPage == 1 && result.datas!.length == 0) {
        loadState.value = LoadState.EMPTY;
      } else if (curPage == pageCount) {
        loadState.value = LoadState.NO_MORE;
        refreshController!.loadNoData();
        refreshController!.refreshCompleted();
      } else {
        loadState.value = LoadState.SUCCESS;
        refreshController!.loadComplete();
        pageIndex++;
      }
    }, failture: (errorMessage) {
      refreshController!.loadFailed();
    });
  }

  void cleanAllHistory(){
    SpUtil.putStringList(Constant.KEY_SEARCH_HISTORY, []);
    searchHistory.value=[];
  }


}