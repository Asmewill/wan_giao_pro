import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_giao_pro/page/index_page.dart';
import 'package:wan_giao_pro/page/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
          GetPage(name: "/index_page", page: ()=>IndexPage())
        ],
        debugShowCheckedModeBanner: true,
      ),
    ));
  }
}
