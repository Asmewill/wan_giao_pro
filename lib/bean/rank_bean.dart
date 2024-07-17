/// data : {"curPage":1,"datas":[{"coinCount":149348,"level":1494,"nickname":"goweii","rank":"1","userId":20382,"username":"g**eii"},{"coinCount":89069,"level":891,"nickname":"Lgxing","rank":"2","userId":29390,"username":"L**ing"},{"coinCount":86181,"level":862,"nickname":"","rank":"3","userId":7809,"username":"1**23822235"},{"coinCount":82836,"level":829,"nickname":"wcedla","rank":"4","userId":28457,"username":"w**dla"},{"coinCount":79035,"level":791,"nickname":"ChenY","rank":"5","userId":42260,"username":"C**nY"},{"coinCount":78901,"level":790,"nickname":"","rank":"6","userId":29303,"username":"深**士"},{"coinCount":78000,"level":780,"nickname":"请你喝娃哈哈","rank":"7","userId":3825,"username":"请**娃哈哈"},{"coinCount":77743,"level":778,"nickname":"","rank":"8","userId":26707,"username":"p**xc.com"},{"coinCount":77391,"level":774,"nickname":"","rank":"9","userId":25128,"username":"f**wandroid"},{"coinCount":77080,"level":771,"nickname":"","rank":"10","userId":13273,"username":"1**17315362"},{"coinCount":75996,"level":760,"nickname":"","rank":"11","userId":7710,"username":"i**Cola7"},{"coinCount":75190,"level":752,"nickname":"","rank":"12","userId":25419,"username":"蔡**打篮球"},{"coinCount":73200,"level":732,"nickname":"","rank":"13","userId":2068,"username":"i**Cola"},{"coinCount":72785,"level":728,"nickname":"","rank":"14","userId":833,"username":"w**lwaywang6"},{"coinCount":71070,"level":711,"nickname":"","rank":"15","userId":12351,"username":"w**igeny"},{"coinCount":69894,"level":699,"nickname":"鸿洋","rank":"16","userId":2,"username":"x**oyang"},{"coinCount":68063,"level":681,"nickname":"","rank":"17","userId":2657,"username":"a**111993@163.com"},{"coinCount":66687,"level":667,"nickname":"","rank":"18","userId":17180,"username":"l**ngchao"},{"coinCount":66191,"level":662,"nickname":"","rank":"19","userId":7891,"username":"h**zkp"},{"coinCount":65355,"level":654,"nickname":"","rank":"20","userId":671,"username":"L**Chich"},{"coinCount":63971,"level":640,"nickname":"","rank":"21","userId":16289,"username":"Ａ**ｒｏｉｄ"},{"coinCount":62449,"level":625,"nickname":"","rank":"22","userId":13143,"username":"P**ceHolder"},{"coinCount":61845,"level":619,"nickname":"","rank":"23","userId":25793,"username":"F**_2014"},{"coinCount":59397,"level":594,"nickname":"","rank":"24","userId":14839,"username":"x**y_sjc"},{"coinCount":58957,"level":590,"nickname":"","rank":"25","userId":17645,"username":"F**tasyLin"},{"coinCount":58857,"level":589,"nickname":"","rank":"26","userId":1580,"username":"k**od21"},{"coinCount":58075,"level":581,"nickname":"","rank":"27","userId":29811,"username":"虚**菜鸡"},{"coinCount":55520,"level":556,"nickname":"","rank":"28","userId":2160,"username":"R**iner"},{"coinCount":55093,"level":551,"nickname":"","rank":"29","userId":14829,"username":"l**changwen"},{"coinCount":54735,"level":548,"nickname":"","rank":"30","userId":2786,"username":"8**408834@qq.com"}],"offset":0,"over":false,"pageCount":4497,"size":30,"total":134893}
/// errorCode : 0
/// errorMsg : ""

class RankBean {
  RankBean({
    RankData? data,
      num? errorCode,
      String? errorMsg,}){
    _data = data;
    _errorCode = errorCode;
    _errorMsg = errorMsg;
}

  RankBean.fromJson(dynamic json) {
    _data = json['data'] != null ? RankData.fromJson(json['data']) : null;
    _errorCode = json['errorCode'];
    _errorMsg = json['errorMsg'];
  }
  RankData? _data;
  num? _errorCode;
  String? _errorMsg;

  RankData? get data => _data;
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
/// datas : [{"coinCount":149348,"level":1494,"nickname":"goweii","rank":"1","userId":20382,"username":"g**eii"},{"coinCount":89069,"level":891,"nickname":"Lgxing","rank":"2","userId":29390,"username":"L**ing"},{"coinCount":86181,"level":862,"nickname":"","rank":"3","userId":7809,"username":"1**23822235"},{"coinCount":82836,"level":829,"nickname":"wcedla","rank":"4","userId":28457,"username":"w**dla"},{"coinCount":79035,"level":791,"nickname":"ChenY","rank":"5","userId":42260,"username":"C**nY"},{"coinCount":78901,"level":790,"nickname":"","rank":"6","userId":29303,"username":"深**士"},{"coinCount":78000,"level":780,"nickname":"请你喝娃哈哈","rank":"7","userId":3825,"username":"请**娃哈哈"},{"coinCount":77743,"level":778,"nickname":"","rank":"8","userId":26707,"username":"p**xc.com"},{"coinCount":77391,"level":774,"nickname":"","rank":"9","userId":25128,"username":"f**wandroid"},{"coinCount":77080,"level":771,"nickname":"","rank":"10","userId":13273,"username":"1**17315362"},{"coinCount":75996,"level":760,"nickname":"","rank":"11","userId":7710,"username":"i**Cola7"},{"coinCount":75190,"level":752,"nickname":"","rank":"12","userId":25419,"username":"蔡**打篮球"},{"coinCount":73200,"level":732,"nickname":"","rank":"13","userId":2068,"username":"i**Cola"},{"coinCount":72785,"level":728,"nickname":"","rank":"14","userId":833,"username":"w**lwaywang6"},{"coinCount":71070,"level":711,"nickname":"","rank":"15","userId":12351,"username":"w**igeny"},{"coinCount":69894,"level":699,"nickname":"鸿洋","rank":"16","userId":2,"username":"x**oyang"},{"coinCount":68063,"level":681,"nickname":"","rank":"17","userId":2657,"username":"a**111993@163.com"},{"coinCount":66687,"level":667,"nickname":"","rank":"18","userId":17180,"username":"l**ngchao"},{"coinCount":66191,"level":662,"nickname":"","rank":"19","userId":7891,"username":"h**zkp"},{"coinCount":65355,"level":654,"nickname":"","rank":"20","userId":671,"username":"L**Chich"},{"coinCount":63971,"level":640,"nickname":"","rank":"21","userId":16289,"username":"Ａ**ｒｏｉｄ"},{"coinCount":62449,"level":625,"nickname":"","rank":"22","userId":13143,"username":"P**ceHolder"},{"coinCount":61845,"level":619,"nickname":"","rank":"23","userId":25793,"username":"F**_2014"},{"coinCount":59397,"level":594,"nickname":"","rank":"24","userId":14839,"username":"x**y_sjc"},{"coinCount":58957,"level":590,"nickname":"","rank":"25","userId":17645,"username":"F**tasyLin"},{"coinCount":58857,"level":589,"nickname":"","rank":"26","userId":1580,"username":"k**od21"},{"coinCount":58075,"level":581,"nickname":"","rank":"27","userId":29811,"username":"虚**菜鸡"},{"coinCount":55520,"level":556,"nickname":"","rank":"28","userId":2160,"username":"R**iner"},{"coinCount":55093,"level":551,"nickname":"","rank":"29","userId":14829,"username":"l**changwen"},{"coinCount":54735,"level":548,"nickname":"","rank":"30","userId":2786,"username":"8**408834@qq.com"}]
/// offset : 0
/// over : false
/// pageCount : 4497
/// size : 30
/// total : 134893

class RankData {
  RankData({
      num? curPage,
      List<RankItem>? datas,
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

  RankData.fromJson(dynamic json) {
    _curPage = json['curPage'];
    if (json['datas'] != null) {
      _datas = [];
      json['datas'].forEach((v) {
        _datas?.add(RankItem.fromJson(v));
      });
    }
    _offset = json['offset'];
    _over = json['over'];
    _pageCount = json['pageCount'];
    _size = json['size'];
    _total = json['total'];
  }
  num? _curPage;
  List<RankItem>? _datas;
  num? _offset;
  bool? _over;
  num? _pageCount;
  num? _size;
  num? _total;

  num? get curPage => _curPage;
  List<RankItem>? get datas => _datas;
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

/// coinCount : 149348
/// level : 1494
/// nickname : "goweii"
/// rank : "1"
/// userId : 20382
/// username : "g**eii"

class RankItem {
  RankItem({
      num? coinCount,
      num? level,
      String? nickname,
      String? rank,
      num? userId,
      String? username,}){
    _coinCount = coinCount;
    _level = level;
    _nickname = nickname;
    _rank = rank;
    _userId = userId;
    _username = username;
}

  RankItem.fromJson(dynamic json) {
    _coinCount = json['coinCount'];
    _level = json['level'];
    _nickname = json['nickname'];
    _rank = json['rank'];
    _userId = json['userId'];
    _username = json['username'];
  }
  num? _coinCount;
  num? _level;
  String? _nickname;
  String? _rank;
  num? _userId;
  String? _username;

  num? get coinCount => _coinCount;
  num? get level => _level;
  String? get nickname => _nickname;
  String? get rank => _rank;
  num? get userId => _userId;
  String? get username => _username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['coinCount'] = _coinCount;
    map['level'] = _level;
    map['nickname'] = _nickname;
    map['rank'] = _rank;
    map['userId'] = _userId;
    map['username'] = _username;
    return map;
  }

}