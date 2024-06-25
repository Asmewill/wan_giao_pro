import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';



class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin{
  bool isAnimationFinish = false; //动画时长是否播放完毕
  int timeCount=3;
  Timer? _timer;
  AnimationController?  _animationController;
  Animation<double>? _animation;
  int refreshTime=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController=AnimationController(vsync: this,duration: Duration(seconds: 2));
    _animation=Tween(begin: 0.0,end: 100.0).animate(_animationController!);
    _animation!.addListener(() {
      if(_animationController!.isCompleted){
        isAnimationFinish=true;
      }
      refreshTime++;
      setState(() {
        //print("SplashPage:动画播放次数："+refreshTime!.toString());//动画播放期间，页面刷新多次
      });
    });
    _animationController!.forward();//开始播放动画

    _timer=Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        timeCount--;
        if(timeCount==1){
          _jumpToMain();
        }
      });
    });
  }

  _jumpToMain(){
    _timer!.cancel();
    Get.offNamed("/index_page");
  }

  @override
  Widget build(BuildContext context) {
    //设置尺寸（填写设计中设备的屏幕尺寸）如果设计基于360dp * 690dp的屏幕
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(360, 690));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              child: Center(
            child: Container(
              height: _animation!.value,
              width: _animation!.value,
              color: Colors.white,
              child: FlutterLogo(),
            ),
          )),
          _getTopButton()
        ],
      ),
    );
  }

  Widget _getTopButton() {
    if (!isAnimationFinish) {
      return   Positioned(
          top:MediaQuery.of(context).padding.top+20,
          right: 20,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              child: Container(
                padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
                child: Text(
                  "跳过${timeCount}s",
                  style: TextStyle(color: Colors.white, fontSize: 12.sp),
                ),
                color: Colors.black26.withOpacity(0.6),
              ),
              onTap: (){
                _timer!.cancel();
                Get.offNamed("/index_page");
              },
            ),
          ));
    } else {
      return Container();
    }
  }
}
