import 'package:flutter/material.dart';

class WeChatPage extends StatefulWidget {

  @override
  State<WeChatPage> createState() => _WeChatPageState();
}

class _WeChatPageState extends State<WeChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("微信"),
      ),
      body: const Center(
        child: Text("微信"),
      ),
    );
  }
}
