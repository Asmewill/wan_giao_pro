import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_update_dialog/update_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';

class AppUpdate {
  static UpdateDialog? dialog;

  static checkUpdate(BuildContext context) async {
    dialog = UpdateDialog.showUpdate(context,
        width: 280.w,
        titleTextSize: 14.sp,
        contentTextSize: 12.sp,
        buttonTextSize: 12.sp,
        topImage: Image.asset("assets/images/bg_update_top.png"),
        radius: 8.w,
        themeColor: Color(0xFFFFAC5D),
        progressBackgroundColor: Color(0x5AFFAC5D),
        isForce: false,
        updateButtonText: "升级",
        ignoreButtonText: "忽略此版本",
        enableIgnore: true,
        onIgnore: (){
          dialog!.dismiss();
        },
        title: "是否升级到1.6.6版本",
        updateContent: "AllyBot 1.6.6新版本来了",
        onUpdate: () {
            downLoadApp("1.6.6","http://121.37.31.184:28080/resource/apk/AllyBot_V1.6.6_2024_05_27_11_53_release.apk");
        });
  }
  static downLoadApp(String versionName,String downLoadUrl) async{//storage/emulated/0/Android/data/com.example.wan_giao_pro/files
      var dir = await getExternalStorageDirectory();
      File file= File(dir!.path+"/download/$versionName.apk");
      await Dio().download(downLoadUrl, file.path,onReceiveProgress: (count,total){
        double progress=(count/total).toDouble();
        dialog!.update(progress);
        if(progress==1){
           installApk(file.path);
        }
      });
  }
  static Future installApk(String apkPath) async {
    //调用Android原生代码升级Apk
    var channel = MethodChannel("com.lollipop/install_apk_plugin");
    return await channel.invokeMethod("installApk", {"apkPath": apkPath});
  }
}
