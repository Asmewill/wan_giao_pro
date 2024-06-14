import 'package:wan_giao_pro/bean/article_item.dart';

/// data : [{"adminAdd":false,"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<pre><code>package org.example;\r\n\r\npublic class ParentJava {\r\n    public String name;\r\n}\r\n\r\n import org.example.ParentJava\r\n\r\nclass Child(val name: String): ParentJava()\r\n\r\nfun main() {\r\n    Child(&quot;&quot;).name\r\n}\r\n</code></pre><p>如上代码，运行闪退。</p>\r\n<p>问：为什么？</p>\r\n<p>问题来源于<a href=\"https://www.wanandroid.com/wenda/show/8857?fid=225&amp;date=2023_05_31_17_12_04&amp;message=package%20or#msg_id2773\">xujiafeng</a></p>","descMd":"","envelopePic":"","fresh":false,"host":"","id":26578,"isAdminAdd":false,"link":"https://www.wanandroid.com/wenda/show/26578","niceDate":"2天前","niceShareDate":"2023-05-31 21:19","origin":"","prefix":"","projectLink":"","publishTime":1718025370000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1685539198000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | Java 系列，奇怪的闪退？","type":1,"userId":2,"visible":1,"zan":6},{"adminAdd":false,"apkLink":"","audit":1,"author":"干货","canEdit":false,"chapterId":249,"chapterName":"干货资源","collect":true,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":27996,"isAdminAdd":false,"link":"https://www.xiangxueketang.cn/enjoy/play/native_19","niceDate":"2024-06-06 14:00","niceShareDate":"2024-02-16 15:59","origin":"","prefix":"","projectLink":"","publishTime":1717653646000,"realSuperChapterId":248,"selfVisible":0,"shareDate":1708070363000,"shareUser":"","superChapterId":249,"superChapterName":"干货资源","tags":[],"title":"年薪86W！这个新兴领域真香！建议大家冲一下，钱景真不一般！！！","type":1,"userId":-1,"visible":1,"zan":0}]
/// errorCode : 0
/// errorMsg : ""

class TopArticleData {
  TopArticleData({
      List<ArticleItem>? data,
      num? errorCode,
      String? errorMsg,}){
    _data = data;
    _errorCode = errorCode;
    _errorMsg = errorMsg;
}

  TopArticleData.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ArticleItem.fromJson(v));
      });
    }
    _errorCode = json['errorCode'];
    _errorMsg = json['errorMsg'];
  }
  List<ArticleItem>? _data;
  num?  _errorCode;
  String?  _errorMsg;

  List<ArticleItem>?  get data => _data;
  num?  get errorCode => _errorCode;
  String?  get errorMsg => _errorMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['errorCode'] = _errorCode;
    map['errorMsg'] = _errorMsg;
    return map;
  }

}
