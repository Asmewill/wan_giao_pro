/// data : [{"articleList":[],"author":"","children":[],"courseId":13,"cover":"","desc":"","id":408,"lisense":"","lisenseLink":"","name":"鸿洋","order":190000,"parentChapterId":407,"type":0,"userControlSetTop":false,"visible":1},{"articleList":[],"author":"","children":[],"courseId":13,"cover":"","desc":"","id":409,"lisense":"","lisenseLink":"","name":"郭霖","order":190001,"parentChapterId":407,"type":0,"userControlSetTop":false,"visible":1},{"articleList":[],"author":"","children":[],"courseId":13,"cover":"","desc":"","id":410,"lisense":"","lisenseLink":"","name":"玉刚说","order":190002,"parentChapterId":407,"type":0,"userControlSetTop":false,"visible":1},{"articleList":[],"author":"","children":[],"courseId":13,"cover":"","desc":"","id":411,"lisense":"","lisenseLink":"","name":"承香墨影","order":190003,"parentChapterId":407,"type":0,"userControlSetTop":false,"visible":1},{"articleList":[],"author":"","children":[],"courseId":13,"cover":"","desc":"","id":413,"lisense":"","lisenseLink":"","name":"Android群英传","order":190004,"parentChapterId":407,"type":0,"userControlSetTop":false,"visible":1},{"articleList":[],"author":"","children":[],"courseId":13,"cover":"","desc":"","id":414,"lisense":"","lisenseLink":"","name":"code小生","order":190005,"parentChapterId":407,"type":0,"userControlSetTop":false,"visible":1},{"articleList":[],"author":"","children":[],"courseId":13,"cover":"","desc":"","id":415,"lisense":"","lisenseLink":"","name":"谷歌开发者","order":190006,"parentChapterId":407,"type":0,"userControlSetTop":false,"visible":1},{"articleList":[],"author":"","children":[],"courseId":13,"cover":"","desc":"","id":416,"lisense":"","lisenseLink":"","name":"奇卓社","order":190007,"parentChapterId":407,"type":0,"userControlSetTop":false,"visible":1},{"articleList":[],"author":"","children":[],"courseId":13,"cover":"","desc":"","id":417,"lisense":"","lisenseLink":"","name":"美团技术团队","order":190008,"parentChapterId":407,"type":0,"userControlSetTop":false,"visible":1},{"articleList":[],"author":"","children":[],"courseId":13,"cover":"","desc":"","id":420,"lisense":"","lisenseLink":"","name":"GcsSloop","order":190009,"parentChapterId":407,"type":0,"userControlSetTop":false,"visible":1},{"articleList":[],"author":"","children":[],"courseId":13,"cover":"","desc":"","id":421,"lisense":"","lisenseLink":"","name":"互联网侦察","order":190010,"parentChapterId":407,"type":0,"userControlSetTop":false,"visible":1},{"articleList":[],"author":"","children":[],"courseId":13,"cover":"","desc":"","id":427,"lisense":"","lisenseLink":"","name":"susion随心","order":190011,"parentChapterId":407,"type":0,"userControlSetTop":false,"visible":1},{"articleList":[],"author":"","children":[],"courseId":13,"cover":"","desc":"","id":428,"lisense":"","lisenseLink":"","name":"程序亦非猿","order":190012,"parentChapterId":407,"type":0,"userControlSetTop":false,"visible":1},{"articleList":[],"author":"","children":[],"courseId":13,"cover":"","desc":"","id":434,"lisense":"","lisenseLink":"","name":"Gityuan","order":190013,"parentChapterId":407,"type":0,"userControlSetTop":false,"visible":1}]
/// errorCode : 0
/// errorMsg : ""

class WechatBean {
  WechatBean({
      List<WechatItem>? data,
      num? errorCode,
      String? errorMsg,}){
    _data = data;
    _errorCode = errorCode;
    _errorMsg = errorMsg;
}

  WechatBean.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(WechatItem.fromJson(v));
      });
    }
    _errorCode = json['errorCode'];
    _errorMsg = json['errorMsg'];
  }
  List<WechatItem>? _data;
  num? _errorCode;
  String? _errorMsg;

  List<WechatItem>? get data => _data;
  num? get errorCode => _errorCode;
  String? get errorMsg => _errorMsg;

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

/// articleList : []
/// author : ""
/// children : []
/// courseId : 13
/// cover : ""
/// desc : ""
/// id : 408
/// lisense : ""
/// lisenseLink : ""
/// name : "鸿洋"
/// order : 190000
/// parentChapterId : 407
/// type : 0
/// userControlSetTop : false
/// visible : 1

class WechatItem {
  WechatItem({
      List<dynamic>? articleList,
      String? author,
      List<dynamic>? children,
      num? courseId,
      String? cover,
      String? desc,
      num? id,
      String? lisense,
      String? lisenseLink,
      String? name,
      num? order,
      num? parentChapterId,
      num? type,
      bool? userControlSetTop,
      num? visible,}){
    _articleList = articleList;
    _author = author;
    _children = children;
    _courseId = courseId;
    _cover = cover;
    _desc = desc;
    _id = id;
    _lisense = lisense;
    _lisenseLink = lisenseLink;
    _name = name;
    _order = order;
    _parentChapterId = parentChapterId;
    _type = type;
    _userControlSetTop = userControlSetTop;
    _visible = visible;
}

  WechatItem.fromJson(dynamic json) {
    if (json['articleList'] != null) {
      _articleList = [];
      json['articleList'].forEach((v) {
        _articleList?.add("");
      });
    }
    _author = json['author'];
    if (json['children'] != null) {
      _children = [];
      json['children'].forEach((v) {
        _children?.add("");
      });
    }
    _courseId = json['courseId'];
    _cover = json['cover'];
    _desc = json['desc'];
    _id = json['id'];
    _lisense = json['lisense'];
    _lisenseLink = json['lisenseLink'];
    _name = json['name'];
    _order = json['order'];
    _parentChapterId = json['parentChapterId'];
    _type = json['type'];
    _userControlSetTop = json['userControlSetTop'];
    _visible = json['visible'];
  }
  List<dynamic>? _articleList;
  String? _author;
  List<dynamic>? _children;
  num? _courseId;
  String? _cover;
  String? _desc;
  num? _id;
  String? _lisense;
  String? _lisenseLink;
  String? _name;
  num? _order;
  num? _parentChapterId;
  num? _type;
  bool? _userControlSetTop;
  num? _visible;

  List<dynamic>? get articleList => _articleList;
  String? get author => _author;
  List<dynamic>? get children => _children;
  num? get courseId => _courseId;
  String? get cover => _cover;
  String? get desc => _desc;
  num? get id => _id;
  String? get lisense => _lisense;
  String? get lisenseLink => _lisenseLink;
  String? get name => _name;
  num? get order => _order;
  num? get parentChapterId => _parentChapterId;
  num? get type => _type;
  bool? get userControlSetTop => _userControlSetTop;
  num? get visible => _visible;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_articleList != null) {
      map['articleList'] = _articleList?.map((v) => v.toJson()).toList();
    }
    map['author'] = _author;
    if (_children != null) {
      map['children'] = _children?.map((v) => v.toJson()).toList();
    }
    map['courseId'] = _courseId;
    map['cover'] = _cover;
    map['desc'] = _desc;
    map['id'] = _id;
    map['lisense'] = _lisense;
    map['lisenseLink'] = _lisenseLink;
    map['name'] = _name;
    map['order'] = _order;
    map['parentChapterId'] = _parentChapterId;
    map['type'] = _type;
    map['userControlSetTop'] = _userControlSetTop;
    map['visible'] = _visible;
    return map;
  }

}