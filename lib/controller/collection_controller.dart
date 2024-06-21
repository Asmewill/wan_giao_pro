
import 'package:wan_giao_pro/base/base_getx_controller.dart';
import 'package:wan_giao_pro/http/http_manager.dart';

class CollectionController extends BaseGetXController {
  void collectArticle(String id, successful(), failed(String value)) {
    //此处回调了2个函数
    handlerRequest(HttpManager.instance.post("lg/collect/$id/json"), false,
        success: (dynamic value) {
      successful();
     // update();
    }, failture: (dynamic error) {
      failed(error);
    });
  }

  void unCollectionArticle(String id, successful(), failed(String value)) {
    handlerRequest(
        HttpManager.instance.post("lg/uncollect_originId/$id/json"), false,
        success: (dynamic value) {
      successful();
     // update();
    }, failture: (dynamic error) { failed(error);});
  }
}
