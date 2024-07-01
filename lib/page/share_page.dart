import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SharePage extends StatefulWidget {
  @override
  State<SharePage> createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("分享",style: TextStyle(fontSize: 16),),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();

          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}
