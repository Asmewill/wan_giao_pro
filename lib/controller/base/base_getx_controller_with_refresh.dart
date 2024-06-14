


import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'base_getx_controller.dart';

class BaseGetXControllerWithRefresh extends BaseGetXController{
  RefreshController? _refreshController;
  RefreshController? get refreshController => _refreshController;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _refreshController=RefreshController(initialRefresh: false);
  }

  void dispose(){
    super.dispose();
    _refreshController!.dispose();
  }

}