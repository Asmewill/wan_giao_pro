
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wan_giao_pro/theme/app_text.dart';

class LoadingDialog extends StatelessWidget {
  final String message;

  LoadingDialog({Key? key, this.message=""}) : super(key: key);

  //展示加载框
  static void show({String message = KText.loadingText}) {
    Get.dialog(LoadingDialog(message: message));

  }

  //关闭加载框
  static void dismiss() {
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Opacity(
          opacity: 1,
          child: Container(
            width: 150.w,
            height: 100.h,
            decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey,
                  ),
                  width: 40,
                  height: 40,
                ),
                SizedBox(height: 10),
                Text(message, style: TextStyle(fontSize: 14,color: Colors.black))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

