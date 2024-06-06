import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_giao_pro/page/index_page.dart';
import 'package:wan_giao_pro/page/login_page.dart';
import 'package:wan_giao_pro/page/regiseter_page.dart';
import 'package:wan_giao_pro/page/setting_page.dart';
import 'package:wan_giao_pro/page/splash_page.dart';

import 'defalut/global.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Global.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(child: OKToast(
      child: GetMaterialApp(
        initialRoute: "/",
        getPages: [
          GetPage(name: "/", page:()=>SplashPage()),
          GetPage(name: "/index_page", page: ()=>IndexPage()),
          GetPage(name: "/setting_page", page: ()=>SettingPage()),
          GetPage(name: "/login_page",page: ()=>LoginPage()),
          GetPage(name: "/register_page", page: ()=>RegisterPage())
        ],
        debugShowCheckedModeBanner: true,
      ),
    ));
  }
}
