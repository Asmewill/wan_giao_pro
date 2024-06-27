import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wan_giao_pro/compents/icon_font.dart';
import 'package:wan_giao_pro/page/home_page.dart';
import 'package:wan_giao_pro/page/person_page.dart';
import 'package:wan_giao_pro/page/project_page.dart';
import 'package:wan_giao_pro/page/system_page.dart';
import 'package:wan_giao_pro/page/wechat_page.dart';

class IndexPage extends StatefulWidget {
  final _tabs = [
    BottomNavigationBarItem(icon:Image.asset("assets/icon/menu_main.png",width: 20,height: 20,), activeIcon:Icon(Icons.home,size: 22,),label: "首页"),
    BottomNavigationBarItem(icon: Image.asset("assets/icon/menu_public.png",width: 20,height: 20,),activeIcon:Image.asset("assets/icon/ic_weixin.png",width: 20,height: 20,),label: "公众号"),
    BottomNavigationBarItem(icon: Image.asset("assets/icon/menu_tree.png",width: 20,height: 20,),activeIcon:Icon(Icons.account_tree,size:22),label: "体系"),
    BottomNavigationBarItem(icon:  Image.asset("assets/icon/menu_project.png",width: 20,height: 20,),activeIcon:Icon(Icons.apps,size:22), label: "项目"),
    BottomNavigationBarItem(icon:  Image.asset("assets/icon/menu_me.png",width: 20,height: 20,),activeIcon:Icon(Icons.person,size:22), label: "我的"),
  ];

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _pageIndex = 0;
  PageController? controller;
  DateTime? _lastDateTime;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=PageController(initialPage: _pageIndex);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: createBottomUI(),
      body: WillPopScope(
        onWillPop: (){
          if(_lastDateTime==null||DateTime.now().difference(_lastDateTime!)>Duration(seconds: 1)){
            _lastDateTime = DateTime.now();
            showToast("再次点击退出程序",position: ToastPosition.center);
            return Future.value(false);
          }
          return Future.value(true);
        },
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller,
          children: [
            HomePage(),
            WeChatPage(),
            SystemPage(),
            ProjectPage(),
            PersonPage()
          ],
        ),
      ),
    );
  }

  Widget createBottomUI() {
    return BottomNavigationBar(
      items: widget._tabs,
      currentIndex: _pageIndex,
      backgroundColor: Colors.white,
      fixedColor: Colors.blue,//选中的颜色
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _pageIndex=index;
          controller!.jumpToPage(_pageIndex);
        });
      },
    );
  }
}
