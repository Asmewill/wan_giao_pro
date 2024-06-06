import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wan_giao_pro/compents/extend_widget.dart';
import 'package:wan_giao_pro/theme/app_color.dart';
import 'package:wan_giao_pro/theme/app_style.dart';

class RegisterPage extends StatefulWidget {

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("注册",style: TextStyle(fontSize: 16,color: Colors.black),),
        leading: IconButton(icon: Icon(Icons.arrow_back),color: Colors.black,onPressed: (){
          Get.back();
        },),
      ),
      body:Container(
        width: double.infinity,
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.only(top: 50.h)),
            Text("Sign Up",style: TextStyle(fontSize: 28,color:Colors.black,fontWeight: FontWeight.w900),),
            SizedBox(height: 5.h,),
            Text("Welcome to Register App",style: TextStyle(fontSize: 12,color:Colors.orange,fontWeight: FontWeight.w900),),
            SizedBox(height: 30.h,),

            Container(
              margin: EdgeInsets.only(left: 20.h, top: 50.h, right: 20.h),
              height: 42.h,
              child: TextField(
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
                controller: passwordController,
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
                  suffixIcon: passwordController.text.isEmpty
                      ? null
                      : IconButton(
                      onPressed: () {
                        setState(() {
                          passwordController.clear();
                        });
                      },
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.grey,
                      )),
                  hintText: "请输入密码",
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
                controller: passwordConfirmController,
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
                  suffixIcon: passwordConfirmController.text.isEmpty
                      ? null
                      : IconButton(
                      onPressed: () {
                        setState(() {
                          passwordConfirmController.clear();
                        });
                      },
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.grey,
                      )),
                  hintText: "请再次输入密码",
                  focusedBorder: kLoginInputBorder,
                  errorBorder: kLoginInputBorder,
                  focusedErrorBorder: kLoginInputBorder,
                  enabledBorder: kLoginInputBorder,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20,right: 20,top: 20),
              child: GradientButton(
                onPressed: (){
                  showToast("注册");
                },
                child: Text("注册",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                  gradient:LinearGradient(colors: [KColors.kBtnColorStart,KColors.kBtnColorEnd])

              ),
            ),

          ],
        ),
      ),
    );
  }
}


