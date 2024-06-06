

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wan_giao_pro/http/http_manager.dart';

class Global{

  static Future init() async {
    initStatusBar();
    HttpManager.initCookieJar();

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


}