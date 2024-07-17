/// data : {"curPage":1,"datas":[{"coinCount":16,"date":1721098721000,"desc":"2024-07-16 10:58:41 签到 , 积分：12 + 4","id":856799,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":15,"date":1721028184000,"desc":"2024-07-15 15:23:04 签到 , 积分：12 + 3","id":856638,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":14,"date":1720753735000,"desc":"2024-07-12 11:08:55 签到 , 积分：12 + 2","id":856160,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":13,"date":1720693098000,"desc":"2024-07-11 18:18:18 签到 , 积分：12 + 1","id":856006,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":12,"date":1720581362000,"desc":"2024-07-10 11:16:02 签到 , 积分：12 + 0","id":855708,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":40,"date":1719569256000,"desc":"2024-06-28 18:07:36 签到 , 积分：11 + 29","id":853331,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":39,"date":1716952281000,"desc":"2024-05-29 11:11:21 签到 , 积分：11 + 28","id":847299,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":38,"date":1716884429000,"desc":"2024-05-28 16:20:29 签到 , 积分：11 + 27","id":847135,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":37,"date":1707211759000,"desc":"2024-02-06 17:29:19 签到 , 积分：11 + 26","id":824612,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":36,"date":1706491926000,"desc":"2024-01-29 09:32:06 签到 , 积分：11 + 25","id":822901,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":35,"date":1705628288000,"desc":"2024-01-19 09:38:08 签到 , 积分：11 + 24","id":820782,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":34,"date":1705568941000,"desc":"2024-01-18 17:09:01 签到 , 积分：11 + 23","id":820652,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":33,"date":1705376048000,"desc":"2024-01-16 11:34:08 签到 , 积分：11 + 22","id":820031,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":32,"date":1695265114000,"desc":"2023-09-21 10:58:34 签到 , 积分：11 + 21","id":793173,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":31,"date":1695176758000,"desc":"2023-09-20 10:25:58 签到 , 积分：11 + 20","id":792838,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":30,"date":1695007741000,"desc":"2023-09-18 11:29:01 签到 , 积分：11 + 19","id":792257,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":29,"date":1694776679000,"desc":"2023-09-15 19:17:59 签到 , 积分：11 + 18","id":791810,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":28,"date":1693812476000,"desc":"2023-09-04 15:27:56 签到 , 积分：11 + 17","id":788480,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":27,"date":1693548712000,"desc":"2023-09-01 14:11:52 签到 , 积分：11 + 16","id":787870,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":26,"date":1693462750000,"desc":"2023-08-31 14:19:10 签到 , 积分：11 + 15","id":787563,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"}],"offset":0,"over":false,"pageCount":4,"size":20,"total":71}
/// errorCode : 0
/// errorMsg : ""

class PointBean {
  PointBean({
    PointData? data,
      num? errorCode,
      String? errorMsg,}){
    _data = data;
    _errorCode = errorCode;
    _errorMsg = errorMsg;
}

  PointBean.fromJson(dynamic json) {
    _data = json['data'] != null ? PointData.fromJson(json['data']) : null;
    _errorCode = json['errorCode'];
    _errorMsg = json['errorMsg'];
  }
  PointData? _data;
  num? _errorCode;
  String? _errorMsg;

  PointData? get data => _data;
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
/// datas : [{"coinCount":16,"date":1721098721000,"desc":"2024-07-16 10:58:41 签到 , 积分：12 + 4","id":856799,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":15,"date":1721028184000,"desc":"2024-07-15 15:23:04 签到 , 积分：12 + 3","id":856638,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":14,"date":1720753735000,"desc":"2024-07-12 11:08:55 签到 , 积分：12 + 2","id":856160,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":13,"date":1720693098000,"desc":"2024-07-11 18:18:18 签到 , 积分：12 + 1","id":856006,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":12,"date":1720581362000,"desc":"2024-07-10 11:16:02 签到 , 积分：12 + 0","id":855708,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":40,"date":1719569256000,"desc":"2024-06-28 18:07:36 签到 , 积分：11 + 29","id":853331,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":39,"date":1716952281000,"desc":"2024-05-29 11:11:21 签到 , 积分：11 + 28","id":847299,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":38,"date":1716884429000,"desc":"2024-05-28 16:20:29 签到 , 积分：11 + 27","id":847135,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":37,"date":1707211759000,"desc":"2024-02-06 17:29:19 签到 , 积分：11 + 26","id":824612,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":36,"date":1706491926000,"desc":"2024-01-29 09:32:06 签到 , 积分：11 + 25","id":822901,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":35,"date":1705628288000,"desc":"2024-01-19 09:38:08 签到 , 积分：11 + 24","id":820782,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":34,"date":1705568941000,"desc":"2024-01-18 17:09:01 签到 , 积分：11 + 23","id":820652,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":33,"date":1705376048000,"desc":"2024-01-16 11:34:08 签到 , 积分：11 + 22","id":820031,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":32,"date":1695265114000,"desc":"2023-09-21 10:58:34 签到 , 积分：11 + 21","id":793173,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":31,"date":1695176758000,"desc":"2023-09-20 10:25:58 签到 , 积分：11 + 20","id":792838,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":30,"date":1695007741000,"desc":"2023-09-18 11:29:01 签到 , 积分：11 + 19","id":792257,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":29,"date":1694776679000,"desc":"2023-09-15 19:17:59 签到 , 积分：11 + 18","id":791810,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":28,"date":1693812476000,"desc":"2023-09-04 15:27:56 签到 , 积分：11 + 17","id":788480,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":27,"date":1693548712000,"desc":"2023-09-01 14:11:52 签到 , 积分：11 + 16","id":787870,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"},{"coinCount":26,"date":1693462750000,"desc":"2023-08-31 14:19:10 签到 , 积分：11 + 15","id":787563,"reason":"签到","type":1,"userId":31349,"userName":"dstest0001"}]
/// offset : 0
/// over : false
/// pageCount : 4
/// size : 20
/// total : 71

class PointData {
  PointData({
      num? curPage,
      List<PointItem>? datas,
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

  PointData.fromJson(dynamic json) {
    _curPage = json['curPage'];
    if (json['datas'] != null) {
      _datas = [];
      json['datas'].forEach((v) {
        _datas?.add(PointItem.fromJson(v));
      });
    }
    _offset = json['offset'];
    _over = json['over'];
    _pageCount = json['pageCount'];
    _size = json['size'];
    _total = json['total'];
  }
  num? _curPage;
  List<PointItem>? _datas;
  num? _offset;
  bool? _over;
  num? _pageCount;
  num? _size;
  num? _total;

  num? get curPage => _curPage;
  List<PointItem>? get datas => _datas;
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

/// coinCount : 16
/// date : 1721098721000
/// desc : "2024-07-16 10:58:41 签到 , 积分：12 + 4"
/// id : 856799
/// reason : "签到"
/// type : 1
/// userId : 31349
/// userName : "dstest0001"

class PointItem {
  PointItem({
      num? coinCount,
      num? date,
      String? desc,
      num? id,
      String? reason,
      num? type,
      num? userId,
      String? userName,}){
    _coinCount = coinCount;
    _date = date;
    _desc = desc;
    _id = id;
    _reason = reason;
    _type = type;
    _userId = userId;
    _userName = userName;
}

  PointItem.fromJson(dynamic json) {
    _coinCount = json['coinCount'];
    _date = json['date'];
    _desc = json['desc'];
    _id = json['id'];
    _reason = json['reason'];
    _type = json['type'];
    _userId = json['userId'];
    _userName = json['userName'];
  }
  num? _coinCount;
  num? _date;
  String? _desc;
  num? _id;
  String? _reason;
  num? _type;
  num? _userId;
  String? _userName;

  num? get coinCount => _coinCount;
  num? get date => _date;
  String? get desc => _desc;
  num? get id => _id;
  String? get reason => _reason;
  num? get type => _type;
  num? get userId => _userId;
  String? get userName => _userName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['coinCount'] = _coinCount;
    map['date'] = _date;
    map['desc'] = _desc;
    map['id'] = _id;
    map['reason'] = _reason;
    map['type'] = _type;
    map['userId'] = _userId;
    map['userName'] = _userName;
    return map;
  }

}