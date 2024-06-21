


import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'base_getx_controller.dart';

class BaseGetXControllerWithRefresh extends BaseGetXController{
  RefreshController? _refreshController;
  RefreshController? get refreshController => _refreshController;


  void  setRefreshController(RefreshController value) {
    _refreshController = value;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //这里不在初始化，通过设置的方式传递值
     //注册登录之后，跳转到首页报错
    //包含底部多个bottomNavigationBar页面，其中一个页面使用SmartRefresher，初次进入改页面正常，从此页面跳到其他bottomNavigationBar页面，然后返回此页面报错
    //2.0.0null safety版本，报错「Don't use one refreshController to multiple SmartRefresher,It will cause some unexpected bugs mostly in TabBarView」
    //_refreshController=RefreshController(initialRefresh: false);
  }

  void dispose(){
    super.dispose();
    _refreshController!.dispose();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _refreshController!.dispose();
  }

}