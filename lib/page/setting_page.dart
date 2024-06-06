import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wan_giao_pro/compents/extend_widget.dart';
import 'package:wan_giao_pro/page/person_page.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "设置",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10.h),
            child: Column(
              children: [
                Material(
                  color: Colors.white,
                  child: Ink(
                    child: InkWell(
                      child: Container(
                        width: double.infinity,
                        height: 50.h,
                        padding: EdgeInsets.only(left: 20, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "检查版本",
                              style: TextStyle(fontSize: 14),
                            ),
                            Row(
                              children: [
                                Text("1.0.6",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14)),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.navigate_next,
                                  color: Colors.black26,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        showToast("aaa");
                      },
                    ),
                  ),
                ),
                Line(),
                Material(
                  color: Colors.white,
                  child: Ink(
                    child: InkWell(
                      child: Container(
                        width: double.infinity,
                        height: 50.h,
                        padding: EdgeInsets.only(left: 20, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "作者",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Row(
                              children: [
                                Text("Owen",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14)),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.navigate_next,
                                  color: Colors.black26,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        showToast("aaa");
                      },
                    ),
                  ),
                ),
                Line(),
                Material(
                  color: Colors.white,
                  child: Ink(
                    child: InkWell(
                      child: Container(
                        width: double.infinity,
                        height: 50.h,
                        padding: EdgeInsets.only(left: 20, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "邮箱",
                              style: TextStyle(fontSize: 14),
                            ),
                            Row(
                              children: [
                                Text(
                                  "canikissyou@gmail.com",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.navigate_next,
                                  color: Colors.black26,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        showToast("aaa");
                      },
                    ),
                  ),
                ),
                Line(),
                Material(
                  color: Colors.white,
                  child: Ink(
                    child: InkWell(
                      child: Container(
                        width: double.infinity,
                        height: 50.h,
                        padding: EdgeInsets.only(left: 20, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "项目地址-GitHub",
                              style: TextStyle(fontSize: 14),
                            ),
                            Icon(
                              Icons.navigate_next,
                              color: Colors.black26,
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        showToast("aaa");
                      },
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: double.infinity,
                  height: 40.h,
                  color: Colors.white,
                  child:TextButton(onPressed: (){
                    showToast("退出登录");
                  }, child: Text("退出登录",style: TextStyle(color:Colors.red),)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
