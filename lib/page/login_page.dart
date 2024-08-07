import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wan_giao_pro/controller/login_controller.dart';
import 'package:wan_giao_pro/theme/app_color.dart';
import 'package:wan_giao_pro/theme/app_style.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userNameController = TextEditingController();
  final userPwdController = TextEditingController();
  final loginController=Get.find<LoginController>();
  final FocusNode pwdFocusNode = FocusNode();
  final FocusNode userNameFocusNode = FocusNode();
  bool obscure=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "登录",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        centerTitle: true,
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
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 60.h),
              child: Text(
                "WAN GIAO",
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.h),
              child: Text(
                "Good to see you again",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.orange,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.h, top: 50.h, right: 20.h),
              height: 42.h,
              child: TextField(
                focusNode: userNameFocusNode,
                controller: userNameController,
                style: TextStyle(fontSize: 15.sp, color: Colors.black),
                onChanged: (String v) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                  suffixIcon: userNameController.text.isEmpty
                      ? null
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              userNameController.clear();
                            });
                          },
                          icon: Icon(
                            Icons.cancel,
                            color: Colors.grey,
                          )),
                  hintText: "请输入用户名",
                  focusedBorder: kLoginInputBorder,
                  errorBorder: kLoginInputBorder,
                  focusedErrorBorder: kLoginInputBorder,
                  enabledBorder: kLoginInputBorder,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.h, top: 20.h, right: 20.h),
              height: 42.h,
              child: TextField(
                controller: userPwdController,
                focusNode: pwdFocusNode,
                obscureText: obscure,
                style: TextStyle(fontSize: 15.sp, color: Colors.black),
                onChanged: (String v) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.grey,
                  ),
                  suffixIcon:Container(
                    width: 100.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        userPwdController.text.isEmpty?Container():
                        InkWell(
                          child:Icon(
                            Icons.cancel,
                            color: Colors.grey,
                          ),
                          onTap: (){
                            setState(() {
                              userPwdController.clear();
                            });

                          },
                        ),
                        SizedBox(width: 10,),
                        InkWell(
                          child:Icon(
                            obscure?Icons.visibility:Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onTap: (){
                            setState(() {
                              this.obscure=!this.obscure;
                            });

                          },
                        ),
                        SizedBox(width: 10,),

                      ],
                    ),
                  ),
                  hintText: "请输入密码",
                  focusedBorder: kLoginInputBorder,
                  errorBorder: kLoginInputBorder,
                  focusedErrorBorder: kLoginInputBorder,
                  enabledBorder: kLoginInputBorder,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20,right: 20,top: 20),
              child:  InkWell(
                splashColor: Colors.transparent, // 移除水波纹效果
                highlightColor: Colors.transparent, // 移除点击高亮效果
                child: Container(
                  height: 40.h,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    "登录",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                      gradient: kBtnLinearGradient,
                      boxShadow: [
                        BoxShadow(
                            color: KColors.kBtnShadowColor,
                            offset: Offset(0, 8),
                            blurRadius: 20)
                      ],
                      borderRadius: BorderRadius.circular(20.h)),
                ),
                onTap: () {
                  //解决登录之后，键盘异常弹起问题
                  pwdFocusNode.unfocus();
                  userNameFocusNode.unfocus();
                  loginController.doLogin(userNameController.text, userPwdController.text);

                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child:Container(
                constraints:BoxConstraints(minWidth: 150.h,maxWidth: ScreenUtil.defaultSize.width,minHeight: 40.h,maxHeight: 80.h) ,
                alignment: Alignment.center,
                child: InkWell(
                  child: Container(
                    padding: EdgeInsets.all(5.h),
                    child: Text(
                      "没有账号?去注册",
                      style: TextStyle(fontSize: 14, color: Colors.grey),textAlign: TextAlign.center,
                    ),
                  ),
                  onTap: (){
                    Get.toNamed("/register_page");
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userNameFocusNode.dispose();
    pwdFocusNode.dispose();
  }

}
