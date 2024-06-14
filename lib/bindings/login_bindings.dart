
import 'package:get/get.dart';
import 'package:wan_giao_pro/controller/login_controller.dart';

class LoginBindings extends Bindings{
  @override
  void dependencies() {
    //只有当第一次使用Get.find<DeviceInfoController>时，DeviceInfoController才会被调用。
    Get.lazyPut(() => LoginController());
  }

}