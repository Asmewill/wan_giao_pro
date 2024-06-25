import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wan_giao_pro/bean/question_bean.dart';
import 'package:wan_giao_pro/compents/state_page.dart';
import 'package:wan_giao_pro/controller/question_controller.dart';

class QuestionPage extends StatefulWidget {
  RefreshController refreshController;

  QuestionPage(this.refreshController);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  QuestionController questionController =Get.put<QuestionController>(QuestionController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    questionController.setRefreshController(widget.refreshController);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:GetX<QuestionController>( initState: (state){
        questionController.getQuestion(true);
      },builder: (controller){
        return  SmartRefresher(
            controller: questionController!.refreshController!,
            header: ClassicHeader(),
            enablePullUp: true,
            enablePullDown: true,
            onRefresh: () async {
              questionController!.refresh();
            },
            onLoading: () async {
              questionController!.getQuestion(false);
            },
            child: _bodyStateWidget(questionController));
      })
    );
  }


  _bodyStateWidget(QuestionController controller) {
    if (controller.loadState.value == LoadState.LOADING) {
      return LoadingPage();
    } else if (controller.loadState.value == LoadState.EMPTY) {
      return EmptyPage(
        onPressed: () {
          controller.refresh();
        },
      );
    } else if (controller.loadState.value == LoadState.FAILURE) {
      return NetWorkErrorPage(
          onPressed: () {
            controller.refresh();
          },
          errorMsg: "网络加载失败,请稍后重试!!!");
    } else if (controller.loadState.value == LoadState.SUCCESS) {
      return ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            QuestionItem questionItem = controller.questionItems[index];
            return Container(
              height: 100.h,
              child: Card(
                margin: EdgeInsets.only(
                    left: 8.w, top: 5.h, right: 8.w, bottom: 5.h),
                elevation: 1.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 5.h,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 1, bottom: 1),
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Colors.green, width: 1)),
                          child:
                          Text(questionItem.tags?[0].name??"", style: TextStyle(fontSize: 10.sp)),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5.w),
                          padding: EdgeInsets.only(top: 1, bottom: 1),
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Colors.green, width: 1)),
                          child: Text(questionItem.tags?[1].name??"", style: TextStyle(fontSize: 10.sp)),
                        ),
                        Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: 5),
                              alignment: Alignment.centerRight,
                              child: Text(getAuthor(questionItem)??"",
                                  style: TextStyle(fontSize: 10.sp)),
                            ))
                      ],
                    ),
                    Container(
                      height: 50.h,
                      margin: EdgeInsets.only(left: 5, right: 5),
                      alignment: Alignment.centerLeft,
                      child: Text(
                            questionItem.title??"",
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 5,
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        questionItem.chapterName??""+"/"+(questionItem.superChapterName??"")+(questionItem.niceShareDate??""),
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.orange,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Container(
              width: double.infinity,
              height: 0.0.h,
              color: Colors.transparent.withOpacity(0.2),
            );
          },
          itemCount: questionController.questionItems.length);

    }
  }

  String? getAuthor(QuestionItem questionItem) {
    String? author = "";
    if (questionItem.author != null && questionItem.author!.length > 0) {
      author = questionItem.author!;
    } else {
      author = questionItem.shareUser;
    }
    return author;
  }

}
