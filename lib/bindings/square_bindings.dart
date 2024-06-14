import 'package:get/get.dart';
import 'package:wan_giao_pro/controller/square_controller.dart';

class SquareBindings extends Bindings{
  @override
  void dependencies() {
     Get.lazyPut(() =>SquareController());
  }
}