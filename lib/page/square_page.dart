import 'package:flutter/material.dart';

class SquarePage extends StatefulWidget {

  @override
  State<SquarePage> createState() => _SquarePageState();
}

class _SquarePageState extends State<SquarePage> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text("广场"),
    );
  }
}
