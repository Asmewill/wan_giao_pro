import 'package:wan_giao_pro/base/base_getx_controller.dart';
import 'package:wan_giao_pro/bean/coin_data.dart';
import 'package:wan_giao_pro/http/http_manager.dart';
import 'package:get/get.dart';
import 'package:wan_giao_pro/http/request_api.dart';

class UserInfoController extends BaseGetXController{
  var _coin=Coin().obs;
  var _messageCount=0.obs;
  Coin get coin => _coin.value;
  int get messageCount => _messageCount.value;



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserCoin();
    getMessage();
    
  }

  void getUserCoin() {
    HttpManager.instance.get(RequestApi.USER_INFO).then((value){
      Coin coin=CoinData.fromJson(value).data!;
      _coin.value=coin;
    });
  }

  void getMessage(){
    HttpManager.instance.get(RequestApi.COUNT_UNREAD).then((value){
       _messageCount.value=value["data"]+10;
    });
  }



}