import 'package:oktoast/oktoast.dart';
import 'package:wan_giao_pro/base/base_getx_controller.dart';
import 'package:wan_giao_pro/bean/system_bean.dart';
import 'package:wan_giao_pro/compents/state_page.dart';
import 'package:wan_giao_pro/http/http_manager.dart';
import 'package:get/get.dart';
import 'package:wan_giao_pro/http/request_api.dart';

class SystemController extends BaseGetXController {
  int pageIndex = 0;
  RxString cid = "".obs;
  var systemItems=<SystemItem>[].obs;

  void getSystemList(bool isShowLoading) {
    handlerRequest(
        HttpManager.instance.get(RequestApi.SYSTEM_TREE),
        isShowLoading,
        success: (dynamic value) {
          var result=SystemBean.fromJson(value).data;
          if(result==null){
            return;
          }
          //systemItems.value.addAll(result.datas!);//这样写导致页面不会刷新
          systemItems.addAll(result);
          loadState.value=LoadState.SUCCESS;
        },
        failture: (dynamic value) {
          showToast(value);
        });
  }
}
