import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';

class CollectionPage extends StatefulWidget {
  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "收藏",
          style: TextStyle(fontSize: 16),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back)),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              height: 120.h,
              margin: EdgeInsets.only(
                  left: 5.w, top: 2.5.h, right: 5.w, bottom: 2.5.h),
              child: Card(
                  child: InkWell(
                    onTap: (){
                      showToast("msg");
                    },
                child: Container(
               //   color: Colors.white,//水波纹失效
                  padding: EdgeInsets.all(10.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "干活",
                            style:
                                TextStyle(color: Colors.black, fontSize: 13.sp),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_outlined,
                                color: Colors.grey,
                                size: 20.w,
                              ),
                              Text(
                                "2024-05-19 15:15",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 13.sp),
                              ),
                            ],
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5.h),
                        child: Text(
                          "面试秘籍大发发算法设计阿帆了解啦生发剂拉法面试秘籍大发发算法设计阿帆了解啦生发剂拉法面试秘籍大发发算法设计阿帆了解啦生发剂拉法",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.h),
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.delete,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              )),
            );
          }),
    );
  }
}
