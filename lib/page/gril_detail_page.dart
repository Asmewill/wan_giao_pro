import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:oktoast/oktoast.dart';
import 'package:photo_view/photo_view.dart';
import 'package:wan_giao_pro/controller/gril_detail_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wan_giao_pro/http/http_manager.dart';

class GrilDetailPage extends GetView<GrilDetailController> {

  var imageUrl;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: PhotoView(
                imageProvider: CachedNetworkImageProvider(
                    "http://power-api.cretinzp.com:8000/girls/1/poplkrnggekxnqls.jpg"),
              ),
            ),
          ),
          Positioned(
              bottom: 20.h,
              right: 20.w,
              child: InkWell(
                onTap: () {
                  saveImage();
                },
                child: Text(
                  "保存",
                  style: TextStyle(color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }

  saveImage() async{
    var data =await HttpManager.instance.get(
        "http://power-api.cretinzp.com:8000/girls/1/poplkrnggekxnqls.jpg",
        option: Options(responseType: ResponseType.bytes));
    final result= await ImageGallerySaver.saveImage(
      Uint8List.fromList(data),
      quality: 100,
      name: "grils"
    );
    if(Platform.isAndroid){
      showToast(result!=null?"保存成功":"保存失败",position: ToastPosition.bottom);
    }else{
      showToast(result ? "保存成功" : "保存失败", position: ToastPosition.bottom);
    }
  }



}
