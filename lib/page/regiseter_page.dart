import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wan_giao_pro/compents/extend_widget.dart';
import 'package:wan_giao_pro/controller/register_controller.dart';
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

  final FocusNode userNameFocusNode = FocusNode();
  final FocusNode pwd1FocusNode = FocusNode();
  final FocusNode pwd2FocusNode = FocusNode();
  final registerController=Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("注册",style: TextStyle(fontSize: 16,color: Colors.black),),
        leading: IconButton(icon: Icon(Icons.arrow_back),color: Colors.black,onPressed: (){
          this.userNameFocusNode.unfocus();
          this.pwd1FocusNode.unfocus();
          this.pwd2FocusNode.unfocus();
          Get.back();
        },),
      ),
      body:SingleChildScrollView(
        child: Container(
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
                  focusNode: this.userNameFocusNode,
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
                  focusNode: this.pwd1FocusNode,
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
                  focusNode: this.pwd2FocusNode,
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
                      this.userNameFocusNode.unfocus();
                      this.pwd1FocusNode.unfocus();
                      this.pwd2FocusNode.unfocus();
                      this.registerController.doRegister(userNameController.text, passwordController.text, passwordConfirmController.text);

                    },
                    child: Text("注册",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                    gradient:LinearGradient(colors: [KColors.kBtnColorStart,KColors.kBtnColorEnd])
                ),
              ),

            ],
          ),
        ),
      )
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    this.pwd1FocusNode.dispose();
    this.pwd2FocusNode.dispose();
    this.userNameFocusNode.dispose();
  }
}


