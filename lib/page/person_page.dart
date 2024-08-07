import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wan_giao_pro/app/app_state.dart';
import 'package:wan_giao_pro/app/constant.dart';
import 'package:wan_giao_pro/compents/extend_widget.dart';
import 'package:wan_giao_pro/compents/icon_text_widget.dart';
import 'package:wan_giao_pro/controller/user_info_controller.dart';
import 'package:wan_giao_pro/defalut/global.dart';

class PersonPage extends StatefulWidget {
  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  //设置状态栏透明，导航栏白色

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _topBarWidget(),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              _personInfoWidget(),
              Line(),
              _menuIconWidget(),
              Line(),
              Container(
                height: 80.h,
                width: double.infinity,
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          height: double.infinity,
                          child: IconTextWidget(
                            Icons.person,
                            "妹子",
                            13,
                            Colors.black,
                            verticalSpacing: 6.h,
                            iconColor: Colors.black,
                            onTap: () {
                              Get.toNamed("/gril_page");
                            },
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Container()),
                    Expanded(
                        flex: 1,
                        child: Container()),
                    Expanded(
                        flex: 1,
                        child: Container()),
                  ],
                ),
              ),
              Line(),
            ],
          ),
        ));
  }

  PreferredSizeWidget _topBarWidget() {
    return PreferredSize(
      preferredSize: Size(double.infinity, 80.h),
      child: Container(
        padding: EdgeInsets.only(top: 20.h),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              children: [
                Container(
                  padding:
                      EdgeInsets.only(left: 10, top: 10, right: 0, bottom: 10),
                  height: 60.h,
                  width: 50.w,
                  child: Material(
                    color: Colors.white,
                    child: Ink(
                      child: InkWell(
                        child: Icon(Icons.notifications_none_outlined),
                        onTap: () {
                          showToast("msg");
                        },
                      ),
                    ),
                  ),
                ),
                Positioned(
                    right: 3.w,
                    child: Container(
                      width: 15.w,
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Text(
                          "10",
                          style: TextStyle(color: Colors.white, fontSize: 9),
                        ),
                      ),
                    ))
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, right: 10, bottom: 10),
              width: 50.w,
              height: 60.h,
              child: Material(
                  color: Colors.white,
                  child: Ink(
                      child: InkWell(
                    child: Icon(Icons.settings),
                    onTap: () {
                      Get.toNamed("/setting_page");
                    },
                  ))),
            )
          ],
        ),
      ),
    );
  }

  /***
   * 个人信息Widget
   */
  Widget _personInfoWidget() {
    return Obx(() {
      return Container(
        padding:
            EdgeInsets.only(left: 20.w, right: 20.w, bottom: 5.h, top: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            appState.isLogin.value
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Global.userProfile.username ?? "",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      GetX<UserInfoController>(
                          init: Get.put<UserInfoController>(UserInfoController()),
                          builder: (controller) {
                            return Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 1.h),
                                  child: Text(
                                    "lv"+controller.coin.level.toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent[200]
                                          ?.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 1.h),
                                  child: Text(
                                    "积分 46",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                              ],
                            );
                          })
                    ],
                  )
                : InkWell(
                    child: Text(
                      "立即登录",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w900),
                    ),
                    onTap: () {
                      Get.toNamed("/login_page");
                    },
                  ),
            Container(
              width: 56.w,
              height: 56.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle, // 设置形状为圆形
                image: DecorationImage(
                  image: AssetImage('assets/icon/ic_default_avatar.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  Widget _menuIconWidget() {
    return Container(
      height: 80.h,
      width: double.infinity,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
              flex: 1,
              child: Container(
                height: double.infinity,
                child: IconTextWidget(
                  Icons.collections_outlined,
                  "收藏",
                  13,
                  Colors.black,
                  verticalSpacing: 6.h,
                  iconColor: Colors.black,
                  onTap: () {
                    if(appState.isLogin.value){
                      Get.toNamed("/collection_page");
                    }else{
                      Get.toNamed("/login_page");
                    }
                  },
                ),
              )),
          Expanded(
              flex: 1,
              child: Container(
                height: double.infinity,
                child: IconTextWidget(
                  Icons.web_outlined,
                  "官网",
                  13,
                  Colors.black,
                  verticalSpacing: 6.h,
                  iconColor: Colors.black,
                  onTap: () {
                    Get.toNamed("/web_page", arguments: {
                      Constant.ARTICLE_TITLE: "玩Android",
                      Constant.ARTICLE_URL: "https://www.wanandroid.com/",
                      Constant.ARTICLE_AUTHOR: "鸿阳"
                    });
                  },
                ),
              )),
          Expanded(
              flex: 1,
              child: Container(
                height: double.infinity,
                child: IconTextWidget(
                  Icons.stars_outlined,
                  "积分",
                  13,
                  Colors.black,
                  verticalSpacing: 6.h,
                  iconColor: Colors.black,
                  onTap: () {
                    if(appState.isLogin.value){
                      Get.toNamed("/point_page");
                    }else{
                      Get.toNamed("/login_page");
                    }

                  },
                ),
              )),
          Expanded(
              flex: 1,
              child: Container(
                height: double.infinity,
                child: IconTextWidget(
                  Icons.leaderboard_outlined,
                  "排行榜",
                  13,
                  Colors.black,
                  verticalSpacing: 6.h,
                  iconColor: Colors.black,
                  onTap: () {
                    if(appState.isLogin.value){
                      Get.toNamed("/rank_page");
                    }else{
                      Get.toNamed("/login_page");
                    }
                  },
                ),
              ))
        ],
      ),
    );
  }
}
