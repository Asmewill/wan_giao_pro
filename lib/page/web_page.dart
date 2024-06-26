import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wan_giao_pro/app/constant.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  String articleUrl = "";
  String articleTitle = "";
  String articleAuthor = "";
  late Completer<WebViewController> _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=Completer();
    articleTitle=Get.arguments[Constant.ARTICLE_TITLE];
    articleUrl=Get.arguments[Constant.ARTICLE_URL];
    articleAuthor=Get.arguments[Constant.ARTICLE_AUTHOR];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: Container(
            color: Colors.blue,
            height: 50.h + MediaQuery.of(context).padding.top,
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                ),
                Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.only(left: 50.w, right: 50.w),
                      child: Text(
                        "${articleTitle}",
                        style: TextStyle(fontSize: 14.sp, color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    )),
              ],
            ),
          ),
          preferredSize: Size(double.infinity, 50.h)),
      body: WebView(
        initialUrl: articleUrl,
        javascriptMode: JavascriptMode.unrestricted,
        gestureNavigationEnabled: true,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        onPageStarted: (url) {

        },
        onPageFinished: (url) {

        },
        navigationDelegate: (NavigationRequest request) {
          print("二级导航URL:"+request.url);
          if (!request.url.contains("http")) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
        onWebResourceError: (WebResourceError error) {
          print("加载错误:"+error.description);
        },
      ),
    );
  }
}
