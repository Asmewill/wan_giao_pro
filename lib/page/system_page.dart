import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:wan_giao_pro/bean/system_bean.dart';
import 'package:wan_giao_pro/compents/state_page.dart';
import 'package:wan_giao_pro/controller/square_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wan_giao_pro/controller/system_controller.dart';

class SystemPage extends StatefulWidget {
  @override
  State<SystemPage> createState() => _SystemPageState();
}

class _SystemPageState extends State<SystemPage> {
  SystemController systemController =
      Get.put<SystemController>(SystemController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("体系"),
        ),
        body: GetX<SystemController>(initState: (state) {
          systemController.getSystemList(true);
        }, builder: (SystemController systemController) {
          return _bodyStateWidget(systemController);
        }));
  }

  _bodyStateWidget(SystemController controller) {
    if (controller.loadState.value == LoadState.LOADING) {
      return LoadingPage();
    } else if (controller.loadState.value == LoadState.EMPTY) {
      return EmptyPage(
        onPressed: () {
          controller.getSystemList(true);
        },
      );
    } else if (controller.loadState.value == LoadState.FAILURE) {
      return NetWorkErrorPage(
          onPressed: () {
            controller.getSystemList(true);
          },
          errorMsg: "网络加载失败,请稍后重试!!!");
    } else if (controller.loadState.value == LoadState.SUCCESS||controller.loadState.value==LoadState.NO_MORE) {
      return ListView.builder(
          itemCount: controller.systemItems.length,
          itemBuilder: (context, index) {
            SystemItem systemItem = controller.systemItems[index];
            return StickyHeader(
                header: Container(
                  height: 40.h,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10.w),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(
                              color: Colors.grey.withOpacity(0.1),
                              width: 1.h))),
                  child: Text(
                    systemItem.name??"",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                content: Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Wrap(
                    spacing: 15.0.w,
                    runSpacing: 5.0.h,
                    children: systemItem.children!
                        .map((Children children) => ActionChip(
                            label: Text(children.name??""),
                            backgroundColor: Colors.primaries[
                                Random().nextInt(Colors.primaries.length)],
                            onPressed: () {}))
                        .toList(),
                  ),
                ));
          });
    }
  }
}
