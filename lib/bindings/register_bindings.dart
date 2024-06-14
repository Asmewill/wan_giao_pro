import 'package:get/get.dart';
import 'package:wan_giao_pro/controller/register_controller.dart';

class RegisterBinds extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());

  }

}