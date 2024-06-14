

import 'package:wan_giao_pro/controller/base/base_getx_controller.dart';
import 'package:get/get.dart';

//enum LoginState { LOGIN,LOGIN_OUT}

class AppState extends BaseGetXController{
  var isLogin=false.obs;

}

AppState get appState=>Get.find<AppState>();