import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Line extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 0.5.h,
      color: Colors.grey.withOpacity(0.2),
    );
  }
}


class GradientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Gradient gradient;

  GradientButton({
    required this.onPressed,
    required this.child,
    required this.gradient,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0, // 类似 ElevatedButton 的阴影效果
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0), // 圆角
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          width: double.infinity, // 如果你想让按钮填充其父容器的宽度
          height: 40.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: gradient, // 渐变效果
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: child,
        ),
      ),
    );
  }
}