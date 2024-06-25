/// data : {"curPage":1,"datas":[{"adminAdd":false,"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"message=package%20","descMd":"","envelopePic":"","fresh":false,"host":"","id":26578,"isAdminAdd":false,"link":"https://www.wanandroid.com/wenda/show/26578","niceDate":"2024-06-17 09:16","niceShareDate":"2023-05-31 21:19","origin":"","prefix":"","projectLink":"","publishTime":1718587001000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1685539198000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | Java 系列，奇怪的闪退？","type":0,"userId":2,"visible":0,"zan":6},{"adminAdd":false,"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"是获取调用方的uid，但是这个代码是目标进程调用的，如何通过一个静态方法调用，就拿到调用方的uid呢？</p>","descMd":"","envelopePic":"","fresh":false,"host":"","id":26624,"isAdminAdd":false,"link":"https://wanandroid.com/wenda/show/26624","niceDate":"2024-06-06 11:06","niceShareDate":"2023-06-07 21:01","origin":"","prefix":"","projectLink":"","publishTime":1717643216000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1686142876000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | Binder是如何做到跨进程权限控制的？","type":0,"userId":2,"visible":0,"zan":6}],"offset":0,"over":false,"pageCount":5,"size":40,"total":171}
/// errorCode : 0
/// errorMsg : ""

class QuestionBean {
  QuestionData? _data;
  num? _errorCode;
  String? _errorMsg;

  QuestionBean({
    QuestionData? data,
    num? errorCode,
    String? errorMsg,}){
    _data = data;
    _errorCode = errorCode;
    _errorMsg = errorMsg;
  }

  QuestionBean.fromJson(dynamic json) {
    _data = json['data'] != null ? QuestionData.fromJson(json['data']) : null;
    _errorCode = json['errorCode'];
    _errorMsg = json['errorMsg'];
  }


  QuestionData? get data => _data;
  num? get errorCode => _errorCode;
  String? get errorMsg => _errorMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['errorCode'] = _errorCode;
    map['errorMsg'] = _errorMsg;
    return map;
  }

}

/// curPage : 1
/// datas : [{"adminAdd":false,"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"message=package%20","descMd":"","envelopePic":"","fresh":false,"host":"","id":26578,"isAdminAdd":false,"link":"https://www.wanandroid.com/wenda/show/26578","niceDate":"2024-06-17 09:16","niceShareDate":"2023-05-31 21:19","origin":"","prefix":"","projectLink":"","publishTime":1718587001000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1685539198000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | Java 系列，奇怪的闪退？","type":0,"userId":2,"visible":0,"zan":6},{"adminAdd":false,"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"是获取调用方的uid，但是这个代码是目标进程调用的，如何通过一个静态方法调用，就拿到调用方的uid呢？</p>","descMd":"","envelopePic":"","fresh":false,"host":"","id":26624,"isAdminAdd":false,"link":"https://wanandroid.com/wenda/show/26624","niceDate":"2024-06-06 11:06","niceShareDate":"2023-06-07 21:01","origin":"","prefix":"","projectLink":"","publishTime":1717643216000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1686142876000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | Binder是如何做到跨进程权限控制的？","type":0,"userId":2,"visible":0,"zan":6}]
/// offset : 0
/// over : false
/// pageCount : 5
/// size : 40
/// total : 171

class QuestionData {
  QuestionData({
    num? curPage,
    List<QuestionItem>? datas,
    num? offset,
    bool? over,
    num? pageCount,
    num? size,
    num? total,}){
    _curPage = curPage;
    _datas = datas;
    _offset = offset;
    _over = over;
    _pageCount = pageCount;
    _size = size;
    _total = total;
  }

  QuestionData.fromJson(dynamic json) {
    _curPage = json['curPage'];
    if (json['datas'] != null) {
      _datas = [];
      json['datas'].forEach((v) {
        _datas?.add(QuestionItem.fromJson(v));
      });
    }
    _offset = json['offset'];
    _over = json['over'];
    _pageCount = json['pageCount'];
    _size = json['size'];
    _total = json['total'];
  }
  num? _curPage;
  List<QuestionItem>? _datas;
  num? _offset;
  bool? _over;
  num? _pageCount;
  num? _size;
  num? _total;

  num? get curPage => _curPage;
  List<QuestionItem>? get datas => _datas;
  num? get offset => _offset;
  bool? get over => _over;
  num? get pageCount => _pageCount;
  num? get size => _size;
  num? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['curPage'] = _curPage;
    if (_datas != null) {
      map['datas'] = _datas?.map((v) => v.toJson()).toList();
    }
    map['offset'] = _offset;
    map['over'] = _over;
    map['pageCount'] = _pageCount;
    map['size'] = _size;
    map['total'] = _total;
    return map;
  }

}

/// adminAdd : false
/// apkLink : ""
/// audit : 1
/// author : "xiaoyang"
/// canEdit : false
/// chapterId : 440
/// chapterName : "官方"
/// collect : false
/// courseId : 13
/// desc : "message=package%20"
/// descMd : ""
/// envelopePic : ""
/// fresh : false
/// host : ""
/// id : 26578
/// isAdminAdd : false
/// link : "https://www.wanandroid.com/wenda/show/26578"
/// niceDate : "2024-06-17 09:16"
/// niceShareDate : "2023-05-31 21:19"
/// origin : ""
/// prefix : ""
/// projectLink : ""
/// publishTime : 1718587001000
/// realSuperChapterId : 439
/// selfVisible : 0
/// shareDate : 1685539198000
/// shareUser : ""
/// superChapterId : 440
/// superChapterName : "问答"
/// tags : [{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}]
/// title : "每日一问 | Java 系列，奇怪的闪退？"
/// type : 0
/// userId : 2
/// visible : 0
/// zan : 6

class QuestionItem {
  QuestionItem({
    bool? adminAdd,
    String? apkLink,
    num? audit,
    String? author,
    bool? canEdit,
    num? chapterId,
    String? chapterName,
    bool? collect,
    num? courseId,
    String? desc,
    String? descMd,
    String? envelopePic,
    bool? fresh,
    String? host,
    num? id,
    bool? isAdminAdd,
    String? link,
    String? niceDate,
    String? niceShareDate,
    String? origin,
    String? prefix,
    String? projectLink,
    num? publishTime,
    num? realSuperChapterId,
    num? selfVisible,
    num? shareDate,
    String? shareUser,
    num? superChapterId,
    String? superChapterName,
    List<Tags>? tags,
    String? title,
    num? type,
    num? userId,
    num? visible,
    num? zan,}){
    _adminAdd = adminAdd;
    _apkLink = apkLink;
    _audit = audit;
    _author = author;
    _canEdit = canEdit;
    _chapterId = chapterId;
    _chapterName = chapterName;
    _collect = collect;
    _courseId = courseId;
    _desc = desc;
    _descMd = descMd;
    _envelopePic = envelopePic;
    _fresh = fresh;
    _host = host;
    _id = id;
    _isAdminAdd = isAdminAdd;
    _link = link;
    _niceDate = niceDate;
    _niceShareDate = niceShareDate;
    _origin = origin;
    _prefix = prefix;
    _projectLink = projectLink;
    _publishTime = publishTime;
    _realSuperChapterId = realSuperChapterId;
    _selfVisible = selfVisible;
    _shareDate = shareDate;
    _shareUser = shareUser;
    _superChapterId = superChapterId;
    _superChapterName = superChapterName;
    _tags = tags;
    _title = title;
    _type = type;
    _userId = userId;
    _visible = visible;
    _zan = zan;
  }

  QuestionItem.fromJson(dynamic json) {
    _adminAdd = json['adminAdd'];
    _apkLink = json['apkLink'];
    _audit = json['audit'];
    _author = json['author'];
    _canEdit = json['canEdit'];
    _chapterId = json['chapterId'];
    _chapterName = json['chapterName'];
    _collect = json['collect'];
    _courseId = json['courseId'];
    _desc = json['desc'];
    _descMd = json['descMd'];
    _envelopePic = json['envelopePic'];
    _fresh = json['fresh'];
    _host = json['host'];
    _id = json['id'];
    _isAdminAdd = json['isAdminAdd'];
    _link = json['link'];
    _niceDate = json['niceDate'];
    _niceShareDate = json['niceShareDate'];
    _origin = json['origin'];
    _prefix = json['prefix'];
    _projectLink = json['projectLink'];
    _publishTime = json['publishTime'];
    _realSuperChapterId = json['realSuperChapterId'];
    _selfVisible = json['selfVisible'];
    _shareDate = json['shareDate'];
    _shareUser = json['shareUser'];
    _superChapterId = json['superChapterId'];
    _superChapterName = json['superChapterName'];
    if (json['tags'] != null) {
      _tags = [];
      json['tags'].forEach((v) {
        _tags?.add(Tags.fromJson(v));
      });
    }
    _title = json['title'];
    _type = json['type'];
    _userId = json['userId'];
    _visible = json['visible'];
    _zan = json['zan'];
  }
  bool? _adminAdd;
  String? _apkLink;
  num? _audit;
  String? _author;
  bool? _canEdit;
  num? _chapterId;
  String? _chapterName;
  bool? _collect;
  num? _courseId;
  String? _desc;
  String? _descMd;
  String? _envelopePic;
  bool? _fresh;
  String? _host;
  num? _id;
  bool? _isAdminAdd;
  String? _link;
  String? _niceDate;
  String? _niceShareDate;
  String? _origin;
  String? _prefix;
  String? _projectLink;
  num? _publishTime;
  num? _realSuperChapterId;
  num? _selfVisible;
  num? _shareDate;
  String? _shareUser;
  num? _superChapterId;
  String? _superChapterName;
  List<Tags>? _tags;
  String? _title;
  num? _type;
  num? _userId;
  num? _visible;
  num? _zan;

  bool? get adminAdd => _adminAdd;
  String? get apkLink => _apkLink;
  num? get audit => _audit;
  String? get author => _author;
  bool? get canEdit => _canEdit;
  num? get chapterId => _chapterId;
  String? get chapterName => _chapterName;
  bool? get collect => _collect;
  num? get courseId => _courseId;
  String? get desc => _desc;
  String? get descMd => _descMd;
  String? get envelopePic => _envelopePic;
  bool? get fresh => _fresh;
  String? get host => _host;
  num? get id => _id;
  bool? get isAdminAdd => _isAdminAdd;
  String? get link => _link;
  String? get niceDate => _niceDate;
  String? get niceShareDate => _niceShareDate;
  String? get origin => _origin;
  String? get prefix => _prefix;
  String? get projectLink => _projectLink;
  num? get publishTime => _publishTime;
  num? get realSuperChapterId => _realSuperChapterId;
  num? get selfVisible => _selfVisible;
  num? get shareDate => _shareDate;
  String? get shareUser => _shareUser;
  num? get superChapterId => _superChapterId;
  String? get superChapterName => _superChapterName;
  List<Tags>? get tags => _tags;
  String? get title => _title;
  num? get type => _type;
  num? get userId => _userId;
  num? get visible => _visible;
  num? get zan => _zan;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adminAdd'] = _adminAdd;
    map['apkLink'] = _apkLink;
    map['audit'] = _audit;
    map['author'] = _author;
    map['canEdit'] = _canEdit;
    map['chapterId'] = _chapterId;
    map['chapterName'] = _chapterName;
    map['collect'] = _collect;
    map['courseId'] = _courseId;
    map['desc'] = _desc;
    map['descMd'] = _descMd;
    map['envelopePic'] = _envelopePic;
    map['fresh'] = _fresh;
    map['host'] = _host;
    map['id'] = _id;
    map['isAdminAdd'] = _isAdminAdd;
    map['link'] = _link;
    map['niceDate'] = _niceDate;
    map['niceShareDate'] = _niceShareDate;
    map['origin'] = _origin;
    map['prefix'] = _prefix;
    map['projectLink'] = _projectLink;
    map['publishTime'] = _publishTime;
    map['realSuperChapterId'] = _realSuperChapterId;
    map['selfVisible'] = _selfVisible;
    map['shareDate'] = _shareDate;
    map['shareUser'] = _shareUser;
    map['superChapterId'] = _superChapterId;
    map['superChapterName'] = _superChapterName;
    if (_tags != null) {
      map['tags'] = _tags?.map((v) => v.toJson()).toList();
    }
    map['title'] = _title;
    map['type'] = _type;
    map['userId'] = _userId;
    map['visible'] = _visible;
    map['zan'] = _zan;
    return map;
  }

}

/// name : "本站发布"
/// url : "/article/list/0?cid=440"

class Tags {
  Tags({
    String? name,
    String? url,}){
    _name = name;
    _url = url;
  }

  Tags.fromJson(dynamic json) {
    _name = json['name'];
    _url = json['url'];
  }
  String? _name;
  String? _url;

  String? get name => _name;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['url'] = _url;
    return map;
  }

}