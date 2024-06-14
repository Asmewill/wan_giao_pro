import 'package:flutter/material.dart';
import 'package:pk_skeleton_null_safe/pk_skeleton_null_safe.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum LoadState { LOADING, SUCCESS, FAILURE, DONE, NO_MORE, EMPTY }

class EmptyPage extends StatelessWidget {
  VoidCallback? onPressed;

  EmptyPage({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset(
              "assets/images/no_data.png",
              width: 50,
              height: 50,
            ),
            Text(
              "暂无数据",
              style: TextStyle(color: Colors.black),
            ),
            OutlinedButton(
                onPressed: this.onPressed,
                child: Text(
                  "点击刷新",
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ))
          ],
        ),
      ),
    );
  }
}

class LoadingPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return PKCardListSkeleton(
      isCircularImage: true,
      isBottomLinesActive: true,
      length: 10,
    );
  }
}

class CircularProgressIndicatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}

class NetWorkErrorPage extends StatelessWidget {
  VoidCallback? onPressed;
  final String? errorMsg;

  NetWorkErrorPage({this.onPressed, this.errorMsg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.wifi_off, size: 50.w, color: Colors.blueAccent),
            Padding(padding: EdgeInsets.only(top: 10)),
            Text(
              errorMsg ?? "当前网络不可用",
              style: TextStyle(color: Colors.black),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            OutlinedButton(
                onPressed: onPressed,
                child: Text(
                  "点击重试",
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ))
          ],
        ),
      ),
    );
  }
}
