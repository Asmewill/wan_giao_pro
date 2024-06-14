import 'package:get/get.dart';
import 'package:wan_giao_pro/controller/collection_controller.dart';

class CollectionBinds extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CollectionController());
  }
}
