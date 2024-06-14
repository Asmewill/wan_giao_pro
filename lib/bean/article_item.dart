
/// adminAdd : false
/// apkLink : ""
/// audit : 1
/// author : "鸿洋"
/// canEdit : false
/// chapterId : 408
/// chapterName : "鸿洋"
/// collect : false
/// courseId : 13
/// desc : ""
/// descMd : ""
/// envelopePic : ""
/// fresh : false
/// host : ""
/// id : 28535
/// isAdminAdd : false
/// link : "https://mp.weixin.qq.com/s/Vp1EMRjFYWHMWaJzLNQTBQ"
/// niceDate : "1天前"
/// niceShareDate : "5小时前"
/// origin : ""
/// prefix : ""
/// projectLink : ""
/// publishTime : 1718121600000
/// realSuperChapterId : 407
/// selfVisible : 0
/// shareDate : 1718241323000
/// shareUser : ""
/// superChapterId : 408
/// superChapterName : "公众号"
/// tags : [{"name":"公众号","url":"/wxarticle/list/408/1"}]
/// title : "Gradle直接Run和使用命令行编译有什么区别?"
/// type : 0
/// userId : -1
/// visible : 1
/// zan : 0

class ArticleItem {
  ArticleItem({
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

  ArticleItem.fromJson(dynamic json) {
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


  set setCollect(bool value) {
    _collect = value;
  }

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

/// name : "公众号"
/// url : "/wxarticle/list/408/1"

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