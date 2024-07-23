

import 'package:get/get.dart';
import 'package:wan_giao_pro/controller/search_controller.dart';

class SearchBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController());
  }

}