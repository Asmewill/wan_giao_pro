import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_giao_pro/compents/search_view.dart';
import 'package:wan_giao_pro/page/question_page.dart';
import 'package:wan_giao_pro/page/recommend_page.dart';
import 'package:wan_giao_pro/page/square_page.dart';
import 'package:wan_giao_pro/theme/app_style.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  //TabController? _tabController;
  TextEditingController? textEditingController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController=TextEditingController();
    // _tabController=TabController(length: 7, vsync: this,initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: _topBarView(),
          body: TabBarView(
            //https://github.com/peng8350/flutter_pulltorefresh/issues/483
            //2.0.0null safety版本，报错「Don't use one refreshController to multiple SmartRefresher,It will cause some unexpected bugs mostly in TabBarView」
            children: [SquarePage(RefreshController()), RecommendPage(RefreshController()), QuestionPage(RefreshController())
            ],
          ),
        ));
  }

  PreferredSizeWidget _topBarView() {
    return PreferredSize(
      preferredSize: Size(double.infinity, 100.h),
      child: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top+5),
        color: Colors.blue,
        child: Column(
          children: [
            Container(
              child: TabBar(
                isScrollable: true,
                labelStyle: TextStyle(fontSize: 20),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                unselectedLabelStyle: TextStyle(fontSize: 15),
                //controller:_tabController ,//使用DefaultTabController可以不在使用TabController
                //indicatorColor: Colors.red,
                tabs: [
                  Tab(
                    child: Text("广场"),
                  ),
                  Tab(
                    child: Text("推荐"),
                  ),
                  Tab(
                    child: Text("问答"),
                  ),
                ],
              ),
            ),
            Container(
              width: ScreenUtil.defaultSize.width-50.w,
              height: 35.h,
              child:SearchView(
                //suffixIcon:Icons.cancel,
               // textEditingController: textEditingController,
               // enable: true,
                queryHint: "搜索",
                onTap: (){
                  Get.toNamed("/search_page");
                },
              ) ,
            )
          ],
        ),
      ),
    );
  }
}
