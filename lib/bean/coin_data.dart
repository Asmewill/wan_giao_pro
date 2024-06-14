/// data : {"coinCount":91,"level":1,"nickname":"","rank":"15570","userId":161269,"username":"s**1"}
/// errorCode : 0
/// errorMsg : ""

class CoinData {
  Coin? _data;
  num? _errorCode;
  String? _errorMsg;


  CoinData.fromJson(dynamic json) {
    _data = json['data'] != null ? Coin.fromJson(json['data']) : null;
    _errorCode = json['errorCode'];
    _errorMsg = json['errorMsg'];
  }

  CoinData({
    Coin? data,
    num? errorCode,
    String? errorMsg,}){
    _data = data;
    _errorCode = errorCode;
    _errorMsg = errorMsg;
  }


  Coin? get data => _data;
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

/// coinCount : 91
/// level : 1
/// nickname : ""
/// rank : "15570"
/// userId : 161269
/// username : "s**1"

class Coin {
  Coin({
      num? coinCount,
      num?  level,
      String?  nickname,
      String?  rank,
      num?  userId,
      String?  username,}){
    _coinCount = coinCount;
    _level = level;
    _nickname = nickname;
    _rank = rank;
    _userId = userId;
    _username = username;
}

  Coin.fromJson(dynamic json) {
    _coinCount = json['coinCount'];
    _level = json['level'];
    _nickname = json['nickname'];
    _rank = json['rank'];
    _userId = json['userId'];
    _username = json['username'];
  }
  num?  _coinCount;
  num?  _level;
  String?  _nickname;
  String?  _rank;
  num?  _userId;
  String?  _username;

  num?  get coinCount => _coinCount;
  num?  get level => _level;
  String?  get nickname => _nickname;
  String?  get rank => _rank;
  num?  get userId => _userId;
  String?  get username => _username;

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