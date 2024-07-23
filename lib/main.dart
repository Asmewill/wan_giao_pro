import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_giao_pro/bindings/collection_binds.dart';
import 'package:wan_giao_pro/bindings/login_bindings.dart';
import 'package:wan_giao_pro/bindings/search_bindings.dart';
import 'package:wan_giao_pro/page/gril_detail_page.dart';
import 'package:wan_giao_pro/page/gril_page.dart';
import 'package:wan_giao_pro/page/index_page.dart';
import 'package:wan_giao_pro/page/login_page.dart';
import 'package:wan_giao_pro/page/person_collect_page.dart';
import 'package:wan_giao_pro/page/point_page.dart';
import 'package:wan_giao_pro/page/rank_page.dart';
import 'package:wan_giao_pro/page/register_page.dart';
import 'package:wan_giao_pro/page/search_page.dart';
import 'package:wan_giao_pro/page/setting_page.dart';
import 'package:wan_giao_pro/page/share_page.dart';
import 'package:wan_giao_pro/page/splash_page.dart';
import 'package:wan_giao_pro/page/system_content_page.dart';
import 'package:wan_giao_pro/page/web_page.dart';

import 'bindings/gril_bindings.dart';
import 'bindings/register_bindings.dart';
import 'defalut/global.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Global.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Locale _currentLocale = Locale('zh'); // 默认语言
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
        hideFooterWhenNotFull: false,
        child: OKToast(
          child: GetMaterialApp(
            locale: _currentLocale,
            initialRoute: "/",
            getPages: [
              GetPage(name: "/", page: () => SplashPage()),
              GetPage(
                  name: "/index_page",
                  page: () => IndexPage(),
                  bindings: [CollectionBinds()]),
              GetPage(name: "/setting_page", page: () => SettingPage()),
              GetPage(
                  name: "/login_page",
                  page: () => LoginPage(),
                  bindings: [LoginBindings()]),
              GetPage(
                  name: "/register_page",
                  page: () => RegisterPage(),
                  bindings: [RegisterBinds()],
                  transition: Transition.rightToLeft),
              GetPage(
                  name: "/web_page",
                  page: () => WebPage(),
                  transition: Transition.rightToLeft),
              GetPage(
                  name: "/system_content_page",
                  page: () => SystemContentPage(),
                  transition: Transition.rightToLeft),
              GetPage(
                  name: "/collection_page",
                  page: () => PersonCollectPage(),
                  transition: Transition.fadeIn),
              GetPage(
                  name: "/share_page",
                  page: () => SharePage(),
                  transition: Transition.fadeIn),
              GetPage(
                  name: "/point_page",
                  page: () => PointPage(),
                  transition: Transition.fadeIn
              ),
              GetPage(
                  name: "/rank_page",
                  page: () => RankPage(),
                 // transition: Transition.fadeIn
              ),
              GetPage(
                name: "/gril_page",
                page: () => GrilPage(),
                bindings: [GrilBindings()]
                // transition: Transition.fadeIn
              ),
              GetPage(
                  name: "/gril_detail_page",
                  page: () => GrilDetailPage(),
                  bindings: [GrilBindings()]
                // transition: Transition.fadeIn
              ),
              GetPage(
                  name: "/search_page",
                  page: () => SearchPage(),
                  bindings: [SearchBindings()]
                // transition: Transition.fadeIn
              ),
            ],
            localizationsDelegates: [
              // 这行是关键
              RefreshLocalizations.delegate, //下拉刷新库支持多语言配置
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('zh', 'CH'),
              const Locale('en', 'US'),
            ],
            debugShowCheckedModeBanner: true,
          ),
        ));
  }
}
