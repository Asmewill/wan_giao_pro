

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


InputBorder kLoginInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(50.w),
  borderSide: BorderSide(
    width: 1,
    color: Colors.grey,
  ),
);




SystemUiOverlayStyle lightSystemUiStyle =SystemUiOverlayStyle.light.copyWith(
  statusBarColor: Colors.transparent,
  systemNavigationBarColor: Colors.white,
);
///导航栏透明并且状态栏字体颜色为黑色
SystemUiOverlayStyle darkSystemUiStyle = SystemUiOverlayStyle.dark.copyWith(
  systemNavigationBarColor: Colors.transparent,
);
