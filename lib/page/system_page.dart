import 'package:flutter/material.dart';

class SystemPage extends StatefulWidget {


  @override
  State<SystemPage> createState() => _SystemPageState();
}

class _SystemPageState extends State<SystemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("体系"),
      ),
      body: Center(
        child: Text("体系"),
      ),
    );
  }
}
