

import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wan_giao_pro/compents/state_page.dart';
import 'package:wan_giao_pro/http/http_manager.dart';


typedef Success(dynamic value);
typedef Failture(dynamic value);

abstract class BaseGetXController extends GetxController{
  var loadState = LoadState.DONE.obs;
  //返回都错误结果
  var exception = ResultException(0, "null").obs;

  RxString errorMessage = "加载失败".obs;

  void handlerRequest(Future<dynamic> future,bool isLoading,{Success? success, Failture? failture} ){
    if(isLoading){
      loadState.value=LoadState.LOADING;//显示loading页面
    }
    future.then((value) {
       if(success!=null){
         success(value);
       }
    }).onError<ResultException>((ResultException error,StackTrace stackTrace)async {
         if(isLoading){
           loadState.value=LoadState.FAILURE;//显示加载失败页面
         }
         if(error.code == HttpDioError.LOGIN_CODE){
             Get.toNamed("/login_page");
         }else{
           if(failture!=null){
             failture(error.message);
           }
         }
         errorMessage.value = error.message+"!!!!";
    });
  }

  void initData(bool isShowLoading){

  }

  void refresh(){

  }

}