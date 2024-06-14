import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wan_giao_pro/app/app_state.dart';
import 'package:wan_giao_pro/bean/user_data.dart';
import 'package:wan_giao_pro/compents/dialog_util.dart';
import 'package:wan_giao_pro/controller/base/base_getx_controller.dart';
import 'package:wan_giao_pro/defalut/global.dart';
import 'package:wan_giao_pro/http/http_manager.dart';
import 'package:wan_giao_pro/http/request_api.dart';
import 'package:wan_giao_pro/theme/app_text.dart';

class LoginController extends BaseGetXController {
  void doLogin(String userName, String password) {
    if (userName.isEmpty || password.isEmpty) {
      showToast("用户名或密码不能为空", position: ToastPosition.bottom);
      return;
    }
    LoadingDialog.show(message: KText.loginingText);
    handlerRequest(
        HttpManager.instance.postFormData(RequestApi.LOGIN, {"username": userName.trim(), "password": password.trim()}),
        true,
        success: (value) {
          var user=UserData.fromJson(value).data;
          //登录成功，记住账号和密码
          Global.saveUserProfile(user!);
          appState.isLogin.value=true;
          LoadingDialog.dismiss();
          Get.back();
        },
        failture: (error) {
          LoadingDialog.dismiss();
          Get.snackbar("错误", error,backgroundColor:Colors.red,colorText: Colors.white);
        });
  }
}
