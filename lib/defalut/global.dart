

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
import 'package:wan_giao_pro/app/app_state.dart';
import 'package:wan_giao_pro/bean/user_data.dart';
import 'package:wan_giao_pro/app/constant.dart';
import 'package:wan_giao_pro/http/http_manager.dart';

class Global{
  static User userProfile=User();

  static Future init() async {
    var appState=Get.put<AppState>(AppState());//加载的时候先初始化一下
    await SpUtil.getInstance();
    initStatusBar();
    HttpManager.initCookieJar();
    Map? userMap=SpUtil.getObject(Constant.KEY_USER);
    if(userMap!=null){
      userProfile=User.fromJson(userMap);
      appState.isLogin.value=true;
    }

  }

  static void initStatusBar() {
    if(Platform.isAndroid){
      // 状态栏透明，图标颜色黑色
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark
      ));
    }

  }

  static saveUserProfile(User user){
    SpUtil.putObject(Constant.KEY_USER, user);
    userProfile=user;
  }


}