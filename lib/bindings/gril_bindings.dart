
import 'package:get/get.dart';
import 'package:wan_giao_pro/controller/gril_controller.dart';

class GrilBindings extends Bindings{
  @override
  void dependencies() {
     return Get.lazyPut(() => GrilController());
  }

}