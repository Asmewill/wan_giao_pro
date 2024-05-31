import 'package:flutter/material.dart';

class PersonPage extends StatefulWidget {
  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("个人中心"),
        ),
        body: Center(
          child: Text("个人中心"),
        ));
  }
}
