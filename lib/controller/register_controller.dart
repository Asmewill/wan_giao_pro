
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wan_giao_pro/app/app_state.dart';
import 'package:wan_giao_pro/app/constant.dart';
import 'package:wan_giao_pro/base/base_getx_controller.dart';
import 'package:wan_giao_pro/bean/user_data.dart';
import 'package:wan_giao_pro/compents/dialog_util.dart';
import 'package:wan_giao_pro/defalut/global.dart';
import 'package:wan_giao_pro/event/message_event.dart';
import 'package:wan_giao_pro/http/http_manager.dart';
import 'package:wan_giao_pro/http/request_api.dart';
import 'package:wan_giao_pro/theme/app_text.dart';



class RegisterController extends BaseGetXController{

  void doRegister(String userName,String password,String passwordConfirm){

      if(userName.isEmpty){
          showToast("请输入用户名",position: ToastPosition.bottom);
          return;
      }
      if(password.isEmpty){
        showToast("请输入密码",position: ToastPosition.bottom);
        return;
      }
      if(passwordConfirm.isEmpty){
        showToast("请再次输入密码");
        return;
      }
      if(passwordConfirm!=password){
        showToast("二次输入的密码不一致",position: ToastPosition.bottom);
        return;
      }
      LoadingDialog.show(message: KText.loginingText);
      handlerRequest(HttpManager.instance.postFormData(RequestApi.REGISTER, {
        "username":userName.trim(),
        "password":password.trim(),
        "repassword":passwordConfirm.trim()
      }), true,success: (value){
        var user=UserData.fromJson(value).data;
        Global.saveUserProfile(user!);
        appState.isLogin.value=true;
        LoadingDialog.dismiss();
        //直接返回首页
        Get.offAllNamed("/index_page");
      },failture: (e){
        showToast(e);
        LoadingDialog.dismiss();
      });
  }

}